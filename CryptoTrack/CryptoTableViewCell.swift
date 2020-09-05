
//
//  CryptoTableViewCell.swift
//  CryptoTrack
//
//  Created by Jose Sahagun on 6/8/21.
//  ASU MADRE!
//

import UIKit

class CryptoTableViewCellModel {
    let name: String
    let symbol: String
    let price: String
    let iconUrl: URL?
    var iconData: Data?
    
    init(name: String,
         symbol: String,
         price: String,
         iconUrl: URL?
    ) {
        self.name = name
        self.symbol = symbol
        self.price = price
        self.iconUrl = iconUrl
    }
}

class CryptoTableViewCell: UITableViewCell {
    static let identifier = "CryptoTableViewCell"
    
    // Subviews
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .medium)
        return label
    }()
    
    private let symbolLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemOrange
        label.font = .systemFont(ofSize: 20, weight: .regular)
        return label
    }()
     
    private let priceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .systemGreen
        label.textAlignment = .right
        label.font = .systemFont(ofSize: 22, weight: .semibold)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // Initialize
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(nameLabel)
        contentView.addSubview(symbolLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(iconImageView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    // Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let size: CGFloat = contentView.frame.size.height/1.1
        iconImageView.frame = CGRect(
            x: 20,
            y: (contentView.frame.size.height-size)/2,
            width: size,
            height: size
        )
        
        nameLabel.sizeToFit()
        priceLabel.sizeToFit()
        symbolLabel.sizeToFit()
        
        
        nameLabel.frame = CGRect(
                        x: 25 + size,
                        y: 0,
                        width: contentView.frame.size.width/2,
                        height: contentView.frame.height/2
                    )
        symbolLabel.frame = CGRect(
                        x: 30 + size,
                        y: contentView.frame.size.height/2,
                        width: contentView.frame.size.width/2,
                        height: contentView.frame.height/2
                    )
        
        priceLabel.frame = CGRect(
                        x: contentView.frame.size.width/2,
                        y: 0,
                        width: (contentView.frame.size.width/2)-15 ,
                        height: contentView.frame.height/2
                    )
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        nameLabel.text = nil
        priceLabel.text = nil
        symbolLabel.text = nil
    }
    
    // Configure
    
    func configure(with viewModel: CryptoTableViewCellModel) {
        nameLabel.text = viewModel.name
        symbolLabel.text = viewModel.symbol
        priceLabel.text = viewModel.price
        
        if let data = viewModel.iconData {
            iconImageView.image = UIImage(data: data)
        }
        else if let url = viewModel.iconUrl {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, _ in
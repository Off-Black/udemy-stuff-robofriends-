
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
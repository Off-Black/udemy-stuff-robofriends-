//
//  ViewController.swift
//  CryptoTrack
//
//  Created by Jose Sahagun on 6/3/21.
//

import UIKit

// API Caller
// UI to show different cryptos
// MVVM

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    private let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(CryptoTableViewCell.self,
                           forCellReuseIdentifier: CryptoTableViewCell.identifier )
        return tableView
    } ()
    
    priva
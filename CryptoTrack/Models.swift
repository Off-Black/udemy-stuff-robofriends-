//
//  Models.swift
//  CryptoTrack
//
//  Created by Jose Sahagun on 6/15/21.
//

import Foundation

struct Crypto: Codable {
    let asset_id: String
    let name: String?
    let price_usd: Float?
    let id_icon: String?
    let type_is_crypto: Int?
}

struct Icon: Codable {
    let asset_id: String
    let url: String
}
//"asset_id": "B
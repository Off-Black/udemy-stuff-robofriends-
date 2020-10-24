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
//"asset_id": "BTC",
//    "name": "Bitcoin",
//    "type_is_crypto": 1,
//    "data_start": "2010-07-17",
//    "data_end": "2021-06-15",
//    "data_quote_start": "2014-02-24T17:43:05.0000000Z",
//    "data_quote_end": "2021-06-15T23:31:41.3040078Z",
//    "data_orderbook_start": "2014-02-24T17:43:05.0000000Z",
//    "da
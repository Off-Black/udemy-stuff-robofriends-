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
//    "data_orderbook_end": "2020-08-05T14:38:38.3413202Z",
//    "data_trade_start": "2010-07-17T23:09:17.0000000Z",
//    "data_trade_end": "2021-06-15T23:30:03.0533333Z",
//    "data_symbols_count": 56812,
//    "volume_1hrs_usd": 50842966063194.52,
//    "volume_1day_usd": 657516899
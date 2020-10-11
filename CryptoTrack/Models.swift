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
    let id
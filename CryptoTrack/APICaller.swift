//
//  APICaller.swift
//  CryptoTrack
//
//  Created by Jose Sahagun on 6/3/21.
//

import Foundation

final class APICaller {
    static let shared = APICaller()
    
    private struct Constants {
        static let apiKey = "603D6C0D-5B5F-4E19-9657-A4DE6374AACB"
        static let assetsEndpoint = "https://rest.coinapi.io/v1/assets/"
    }
    
    private init() {}
    
    public var icons: [Icon] = []
    
    private var whenReadyBlock: ((Result<[Crypto], Error>) -> Void)?
    
    // MARK: - Public
    
    public func getAllCryptoData(
        completion: @escaping (Result<[Crypto], Error>) -> Void
    ) {
        
        guard !icons.isEmpty else {
            whenReadyBlock = completion
            return
        }
        
        guard let url = URL(string: Constants.assetsEndpoint + "?apikey=" + Constants.apiKey) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                // Decode response
                let cryptos = try JSONDecoder().decode([Crypto].self, from: data)
                
                completion(.success(cryptos.sorted { first, second -> Bool in
                    return first.price_usd ?? 0 > second.price_usd ?? 0
                }))
                
                completion(.success(cryptos.sorted { first, second -> Bool in
                    return first.type_is_crypto ?? 0 > second.type_is_crypto ?? 0
                }))
                
                
            }
                
            
            catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
    
    public func getAllIcons() {
        guard let url = URL(string:
                "https://rest.coinapi.io/v1/assets/icons/55/?apikey=603D6C0D-5B5F-4E19-9657-A4DE6374AACB")
                else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
        
                do {
                    self?.icons = try JSONDecoder().decode([Icon].self, from: data)
                    if let completion = self?.whenReadyBlock {
                        self?.getAllCryptoData(completion: completion)
                    }
                    
                }
                catch {
                    print(error)
                }
            }
            
            task.resume()

    }

}

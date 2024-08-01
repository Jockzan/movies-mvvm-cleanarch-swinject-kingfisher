//
//  Secrets.swift
//  MoviesApp
//
//  Created by Cardona Basurto, Jockzan on 8/1/24.
//

import Foundation

class Secrets {
    static let shared = Secrets()
    
    private var secrets: [String: Any] = [:]
    
    private init() {
        if let url = Bundle.main.url(forResource: "Secrets", withExtension: "plist") {
            if let data = try? Data(contentsOf: url) {
                secrets = (try? PropertyListSerialization.propertyList(from: data, options: [], format: nil)) as? [String: Any] ?? [:]
            }
        }
    }
    
    func value(forKey key: String) -> String? {
        return secrets[key] as? String
    }
}

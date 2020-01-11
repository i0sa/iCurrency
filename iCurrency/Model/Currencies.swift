//
//  Currencies.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
// MARK: - Currency


struct CurrencyResponse: Codable {
    let success: Bool?
    let timestamp: Int?
    let base: Currency?
    let date: String?
    let rates: [Currency]?
    
    private enum CodingKeys: String, CodingKey {
        case success, timestamp, base, date, rates
    }

    // Custom remapping to an object, instead of the lame [String: Double] thing
    // also remapped the "base" to work with the same model methodolgoy.
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.timestamp = try container.decode(Int.self, forKey: .timestamp)
        if let oldBase = try? container.decode(String.self, forKey: .base) {
            self.base = Currency.init(currency: oldBase, value: 0)
        } else {
            self.base = nil
        }
        self.date = try container.decode(String.self, forKey: .date)

        let oldRates = try container.decode([String: Double].self, forKey: .rates)
        self.rates = oldRates.map({ Currency.init(currency: $0.key, value: $0.value) })
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError()
    }

}

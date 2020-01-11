//
//  Currencies.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
// MARK: - Currency
struct Currency {
    var currency: String?
    var value: Double?
}

struct CurrencyResponse: Codable {
    let success: Bool?
    let timestamp: Int?
    let base, date: String?
    let rates: [Currency]?
    
    private enum CodingKeys: String, CodingKey {
        case success, timestamp, base, date, rates
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.success = try container.decode(Bool.self, forKey: .success)
        self.timestamp = try container.decode(Int.self, forKey: .timestamp)
        self.base = try container.decode(String.self, forKey: .base)
        self.date = try container.decode(String.self, forKey: .date)

        let oldRates = try container.decode([String: Double].self, forKey: .rates)
        self.rates = oldRates.map({ Currency.init(currency: $0.key, value: $0.value) })
    }
    
    func encode(to encoder: Encoder) throws {
        fatalError()
    }

}

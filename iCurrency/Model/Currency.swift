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
    var rate: Double?
    var value: Double?
    
    init(currency: String?, rate: Double?, value: Double? = 1) {
        self.currency = currency
        self.rate = rate
        self.value = value
    }

}

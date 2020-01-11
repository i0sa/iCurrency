//
//  CurrencyImage.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CurrencyImage{
    
    enum ImageSizes: Int {
        case small = 16
        case big = 64
    }
    
    class func getImage(for currency: String, size: ImageSizes = .big) -> String? {
        if let path = Bundle.main.path(forResource: "Currencies", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String: String] {
                    if let result = json.first(where: { $0.value == currency }) {
                        return generateLinkForCountryCode(code: result.key, size: size)
                    }
                    
                }
            } catch {
                
            }

        }
        return nil
    }
    
    private class func generateLinkForCountryCode(code: String, size: ImageSizes) -> String{
        
        return "https://www.countryflags.io/\(code.lowercased())/shiny/\(size.rawValue).png"
    }
}

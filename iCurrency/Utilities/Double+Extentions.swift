//
//  UITableView+Extentions.swift
//
//  Created by Osama on 5/20/19.
//  Copyright © 2019 Osama Gamal. All rights reserved.
//
import Foundation
import UIKit

extension Double {
    // if 5.0, make it 5 -- if 5.1, leave it 5.1
    var clean: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "EN")
        let number = NSNumber(value: self)
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2 //maximum digits in Double after dot (maximum precision)
        return String(formatter.string(from: number) ?? "")
    }
}


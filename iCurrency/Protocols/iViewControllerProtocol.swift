//
//  iViewControllerProtocol.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

protocol iViewControllerProtocol {
    associatedtype viewModelType
    var viewModel: viewModelType! { get }
    
    init(viewModel: viewModelType)
}

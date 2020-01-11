//
//  AuthNavigator.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

class MainNavigator: AppNavigator {
    enum Destination {
        case CurrencyConvertor
    }
    
    weak var coordinator: AppCoordinator?
    required init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func viewController(for destination: Destination, with Coordinator: AppCoordinator?) -> UIViewController {
        switch destination {
        case .CurrencyConvertor:
            let viewModel = CurrencyConvertorViewModel(coordinator: coordinator)
            let view = CurrencyConvertorViewController(viewModel: viewModel)
            
            return view
        }
    }
    
}

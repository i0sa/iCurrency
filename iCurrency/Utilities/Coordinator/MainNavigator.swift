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
        case home
        case CurrencyConvertor(selectedCurrency: Currency, base: Currency)
    }
    
    weak var coordinator: AppCoordinator?
    required init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    
    func viewController(for destination: Destination, with Coordinator: AppCoordinator?) -> UIViewController {
        switch destination {
        case .home:
            let viewModel = MainViewModel(coordinator: coordinator)
            let view = MainViewController(viewModel: viewModel)
            
            return view

        case .CurrencyConvertor(let selected, let base):
            let viewModel = CurrencyConvertorViewModel(coordinator: coordinator, selectedCurrency: selected, base: base)
            let view = CurrencyConvertorViewController(viewModel: viewModel)
            
            return view
        }
    }
    
}

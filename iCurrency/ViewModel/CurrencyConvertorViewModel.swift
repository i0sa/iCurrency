//
//  MainViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CurrencyConvertorViewModel: BaseViewModel {
    var coordinator: AppCoordinator?
    
    required init(coordinator: AppCoordinator?) {
        self.coordinator = coordinator
    }
    
    func viewDidLoad() {
        print("Hey !")
    }
}

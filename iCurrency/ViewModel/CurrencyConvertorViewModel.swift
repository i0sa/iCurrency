//
//  MainViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class CurrencyConvertorViewModel: BaseViewModel {
    weak var delegate: BaseViewModelDelegate?
    weak var coordinator: AppCoordinator?
    var network: NetworkClient?
    
    required init(coordinator: AppCoordinator?, network: NetworkClient = NetworkClient()) {
        self.coordinator = coordinator
        self.network = network
    }
    
    func viewDidLoad() {
        print("Hey !")
    }
}

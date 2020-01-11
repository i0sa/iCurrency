//
//  MainViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

class MainViewModel: BaseViewModel {
    weak var delegate: BaseViewModelDelegate?
    weak var coordinator: AppCoordinator?
    var network: NetworkClient?
    
    required init(coordinator: AppCoordinator?, network: NetworkClient = NetworkClient()) {
        self.coordinator = coordinator
        self.network = network
    }
    
    func viewDidLoad() {
        print("Hey !")
//        loadCurrencies()
    }
    
    func loadCurrencies(){
        network?.performRequest(CurrencyResponse.self, router: .GetCurrencies, success: { (models) in
            print(models)
        }, failure: { (error) in
            print("error")
        })
    }
    
    func didSelectItem(at indexPath: IndexPath){
        coordinator?.Main?.navigate(to: .CurrencyConvertor, with: .present)
    }
}

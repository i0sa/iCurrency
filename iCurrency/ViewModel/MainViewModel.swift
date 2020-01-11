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
    
    var items: [Currency]?{
        didSet{
            
        }
    }
    
    var didFinishLoadingItems: (() -> ())?
    
    required init(coordinator: AppCoordinator?, network: NetworkClient = NetworkClient()) {
        self.coordinator = coordinator
        self.network = network
    }
    
    var numberOfItems: Int {
        return items?.count ?? 0
    }
    
    func item(for indexPath: IndexPath) -> Currency?{
        return items?[indexPath.row]
    }
    
    func viewDidLoad() {
        print("Hey !")
        loadCurrencies()
    }
    
    func loadCurrencies(){
        delegate?.didChangeState(.showLoading)
        network?.performRequest(CurrencyResponse.self, router: .GetCurrencies, success: { [weak self] (models) in
            self?.delegate?.didChangeState(.hideLoading)
            self?.items = models.rates
            self?.didFinishLoadingItems?()
        }, failure: { (error) in
            self.delegate?.didChangeState(.showError(text: error.localizedDescription))
        })
    }
    
    func didSelectItem(at indexPath: IndexPath){
        coordinator?.Main?.navigate(to: .CurrencyConvertor, with: .present)
    }
}

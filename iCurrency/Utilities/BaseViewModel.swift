//
//  BaseViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

enum iState{
    case showError(text: String)
    case showLoading
    case hideLoading
}

protocol BaseViewModelDelegate: class {
    func didChangeState(_ state: iState)
}

protocol BaseViewModel {
    func viewDidLoad()
    var coordinator: AppCoordinator? { get set }
    var network: NetworkClient? { get set }
    init(coordinator: AppCoordinator?, network: NetworkClient)
    var delegate: BaseViewModelDelegate? { get set }
}

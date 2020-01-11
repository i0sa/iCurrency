//
//  BaseViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation

enum iState{
    case showError(text: String)
    case showLoading
    case hideLoading
}

protocol BaseViewModelDelegate: class {
    func didChangeState(_ state: iState)
}

//
//  BaseViewModel.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

protocol BaseViewModel {
    func viewDidLoad()
    var coordinator: AppCoordinator? { get set }
    init(coordinator: AppCoordinator?)
}

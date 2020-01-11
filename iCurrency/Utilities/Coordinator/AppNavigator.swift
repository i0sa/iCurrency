//
//  AppNavigator.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

enum NavigatorType{
    case push
    case present
    case root
}

protocol AppNavigator: class {
    associatedtype Destination
    var coordinator: AppCoordinator? { get } // weak in implmention please
    init(coordinator: AppCoordinator)
    func viewController(for destination: Destination, with Coordinator: AppCoordinator?) -> UIViewController
}

extension AppNavigator {
    public func navigate(to destination: Destination,
                         with type: NavigatorType = .push
                         ){
        let viewController = self.viewController(for: destination, with: coordinator)
        
        switch type {
        case .push:
            coordinator?.navigationController.pushViewController(viewController, animated: true)
            

        case .present:
            coordinator?.navigationController.present(viewController, animated: true)
        case .root:
            coordinator?.navigationController.setViewControllers([viewController], animated: true)
            
        }
    }

}

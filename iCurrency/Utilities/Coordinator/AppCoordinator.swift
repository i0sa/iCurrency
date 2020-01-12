//
//  AppCoordinator.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

/// Main app coordinator that manages basic app flow
class AppCoordinator: Coordinator {
    weak var Main: MainNavigator? {
        get {
            return MainNavigator(coordinator: self)
        }
    }
    private let window: UIWindow

    // Init and deinit
    init(_ window: UIWindow) {
        self.window = window
    }
    
    
    // MARK: Properties
    var navigationController : UINavigationController = {
        let nav = UINavigationController()
        return nav
    }()
    // MARK: Functions
    func start() {
        guard let mainViewController = Main?.viewController(for: .home, with: self) else { return }
        navigationController.setViewControllers([mainViewController], animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    
    func currentViewType() -> UIViewController.Type? {
        return type(of: navigationController.topViewController!)
    }
    
    func typeOf(_ viewController: UIViewController) -> UIViewController.Type? {
        return type(of: viewController)
    }
    
}

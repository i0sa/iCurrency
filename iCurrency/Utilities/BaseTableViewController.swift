//
//  BaseTableViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController<T: BaseViewModel>: UITableViewController, iViewControllerProtocol {
    
    var viewModel: T!
    
    required init(viewModel: T) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

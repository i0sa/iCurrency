//
//  BaseTableViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit
import Toast_Swift

class BaseTableViewController<T: BaseViewModel>: UITableViewController, iViewControllerProtocol {
    
    var viewModel: T!
    
    required init(viewModel: T) {
        self.viewModel = viewModel
        super.init(style: .grouped)
        self.tableView.separatorStyle = .none

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension BaseTableViewController: BaseViewModelDelegate{
    func didChangeState(_ state: iState) {
        switch state {
        case .showError(let text):
            self.view.hideToastActivity()
            self.view.makeToast(text, position: .center)
        case .showLoading:
            self.view.makeToastActivity(.center)
        case .hideLoading:
            self.view.hideToastActivity()
        }
    }
}

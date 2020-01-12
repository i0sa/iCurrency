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
    //Looks for single or multiple taps.


    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel.delegate = self
        self.viewModel.viewDidLoad()
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))        
        view.addGestureRecognizer(tap)
        
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
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

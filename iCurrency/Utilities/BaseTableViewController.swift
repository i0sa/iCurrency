//
//  BaseTableViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

class BaseTableViewController: UITableViewController, iTableViewControllerProtocol {
    
    typealias viewModel = BaseViewModel
    var viewModel: BaseViewModel!
    
    
    required init(viewModel: BaseViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.registerCells()
        // Do any additional setup after loading the view.
    }
    
    
    func registerCells() {
        tableView.registerCell(cellClass: TopCurrencyViewCell.self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

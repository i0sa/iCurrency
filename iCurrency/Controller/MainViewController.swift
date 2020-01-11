//
//  ViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class MainViewController: BaseTableViewController<MainViewModel>, iTableViewControllerProtocol {
    
    override func viewDidLoad() {
        registerCells()
        super.viewDidLoad()        
    }
    

    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeue() as TopCurrencyViewCell
        
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func registerCells() {
        tableView.registerCell(cellClass: TopCurrencyViewCell.self)
    }
}

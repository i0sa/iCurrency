//
//  ViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class MainViewController: BaseTableViewController {
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeue() as TopCurrencyViewCell
        
        return view
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
}

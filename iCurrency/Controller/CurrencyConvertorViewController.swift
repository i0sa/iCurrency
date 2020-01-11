//
//  ViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class CurrencyConvertorViewController: BaseTableViewController<CurrencyConvertorViewModel>, iTableViewControllerProtocol {

    override func viewDidLoad() {
        registerCells()
        super.viewDidLoad()
    }
    

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as MainCurrencyValueCell
        
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeue() as TopCurrencyViewCell
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 70
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func registerCells() {
        tableView.registerCell(cellClass: TopCurrencyViewCell.self)
        tableView.registerCell(cellClass: MainCurrencyValueCell.self)
    }
}
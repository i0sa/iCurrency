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
        self.tableView.backgroundColor = #colorLiteral(red: 0.899692595, green: 0.9141476154, blue: 0.9235479832, alpha: 1)
        viewModel.didFinishLoadingItems = { [weak self] in
            self?.tableView.reloadData()
        }
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as MainCurrencyValueCell
        cell.configure(item: viewModel.item(for: indexPath))
        return cell
    }
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = tableView.dequeue() as TopCurrencyViewCell
        view.configure(item: viewModel.responseItem?.base)
        return view
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 110
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.didSelectItem(at: indexPath)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfItems
    }
    
    func registerCells() {
        tableView.registerCell(cellClass: TopCurrencyViewCell.self)
        tableView.registerCell(cellClass: MainCurrencyValueCell.self)
    }
    
    

}

//
//  ViewController.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit
import Pastel

class CurrencyConvertorViewController: BaseTableViewController<CurrencyConvertorViewModel>, iTableViewControllerProtocol {

    // Why did i do this as in tableview?
    // We can expect a scenario where the client wants to convert between 3 currenies, or such, so it has to be very dynamic
    let pastelView = PastelView()
    
    lazy var closeButton: UIButton = {
        let btn = UIButton(type: .custom)
        btn.imageView?.tintColor = .white
        btn.setImage(UIImage(named: "close"), for: .normal)
        btn.addTarget(self, action: #selector(didPressClosePage(_:)), for: .touchUpInside)
        return btn
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        pastelView.startAnimation()
        
    }
    
    override func viewDidLoad() {
        registerCells()
        super.viewDidLoad()
        addPastelView()
        self.view.addSubview(closeButton)
        setupConstraints()
        tableView.isScrollEnabled = false
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    
    func addPastelView(){
        
        // Custom Direction
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        
        // Custom Duration
        pastelView.animationDuration = 3.0
        
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 76/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 32/255, green: 158/255, blue: 255/255, alpha: 1.0),
                              UIColor(red: 90/255, green: 120/255, blue: 127/255, alpha: 1.0),
                              UIColor(red: 58/255, green: 255/255, blue: 217/255, alpha: 1.0)])
        
        tableView.backgroundView = pastelView

    }
    
    func setupConstraints(){
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        closeButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40),
        closeButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
        closeButton.widthAnchor.constraint(equalToConstant: 40),
        closeButton.heightAnchor.constraint(equalToConstant: 40)
        
        ])
    }
    

    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue() as CurrencyConvertorCell
        if(indexPath.row == 0){
            cell.configure(item: viewModel, isBaseCurrency: true)
        } else {
            cell.configure(item: viewModel)
        }
        return cell
    }

    @objc func didPressClosePage(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return (UIScreen.main.bounds.height - 80) / 2
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func registerCells() {
        tableView.registerCell(cellClass: CurrencyConvertorCell.self)
    }
}

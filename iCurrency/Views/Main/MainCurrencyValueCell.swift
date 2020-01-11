//
//  TopCurrencyViewCell.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit
import Kingfisher

class MainCurrencyValueCell: UITableViewCell {

    lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.distribution = .equalCentering
        s.spacing = 5
        
        return s
    }()
    
    lazy var currencyView: CurrencyView = {
        let c = CurrencyView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return c
    }()
    
    lazy var currencyValue: UILabel = {
        let label = UILabel()
        label.text = "500"
        label.font = UIFont.init(name: "Proxima Nova", size: 30)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
        self.selectionStyle = .none
        self.contentView.backgroundColor = .white
        self.addSubview(stack)
        stack.addArrangedSubview(currencyView)
        stack.addArrangedSubview(currencyValue)
        
        setupConstraints()
    }
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        currencyValue.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            stack.heightAnchor.constraint(equalToConstant: 30),
            // Flag Image

        ])
        
    }
    
    func configure(item: Any?){
        guard let item = item as? Currency else { return }
        currencyView.configure(currency: item)
        self.currencyValue.text = "\(item.value ?? 0)"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

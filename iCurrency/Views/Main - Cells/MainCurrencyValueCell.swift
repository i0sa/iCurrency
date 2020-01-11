//
//  TopCurrencyViewCell.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class MainCurrencyValueCell: UITableViewHeaderFooterView {

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
        label.text = "500 EGP"
        return label
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
        self.contentView.backgroundColor = .white
        self.addSubview(stack)
        stack.addArrangedSubview(currencyView)

        setupConstraints()
    }
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        currencyValue.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stack.heightAnchor.constraint(equalToConstant: 30),
            // Flag Image
//            bottomArrowImage.xwidthAnchor.constraint(equalToConstant: 20),

        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

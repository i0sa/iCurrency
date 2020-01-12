//
//  TopCurrencyViewCell.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit
import Kingfisher
import Pastel

class CurrencyConvertorCell: UITableViewCell {

    lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = UIStackView.Distribution.fillProportionally
        s.alignment = .center
        s.spacing = 13
        
        return s
    }()
    
    lazy var inputField: UITextField = {
        let field = UITextField()
        field.placeholder = "Enter Amount"
        field.textAlignment = .center
        field.font = UIFont.init(name: "Proxima Nova", size: 30)
        field.borderStyle = UITextField.BorderStyle.roundedRect
        return field
    }()
    
    
    lazy var currencyView: CurrencyView = {
        let c = CurrencyView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        c.currencyLabel.textColor = .white
        c.currencyLabel.font = UIFont.init(name: "Proxima Nova", size: 30)

        return c
    }()
    
    lazy var currencyValue: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = UIFont.init(name: "Proxima Nova", size: 40)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
        backgroundColor = .clear
        selectionStyle = .none
        self.addSubview(stack)
        stack.addArrangedSubview(currencyView)
        stack.addArrangedSubview(inputField)
        setupConstraints()
    }
    
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        currencyValue.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        inputField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            inputField.heightAnchor.constraint(equalToConstant: 60),
            currencyView.heightAnchor.constraint(equalToConstant: 60),
            currencyView.widthAnchor.constraint(equalToConstant: 150),

        ])
        
    }
    
    func configure(item: Any?, isBaseCurrency: Bool = false){
        guard let item = item as? Currency else { return }
        currencyView.configure(currency: item)
        if(isBaseCurrency){
        } else {
            backgroundColor = .black
        }
        currencyView.configure(currency: item)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

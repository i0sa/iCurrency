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

    var viewModel: CurrencyConvertorViewModel?
    var didChangeValue: ((Currency) -> ())?
    
    lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .vertical
        s.distribution = UIStackView.Distribution.fill
        s.alignment = .center
        s.spacing = 20
        
        return s
    }()
    
    lazy var inputField: UITextField = {
        let field = UITextField()
        field.textAlignment = .center
        field.textColor = .white
        field.keyboardType = .numberPad
        field.font = UIFont.init(name: "Proxima Nova", size: 60)
        field.addTarget(self, action: #selector(textFieldDidChange(_:)), for: UIControl.Event.editingChanged)
        return field
    }()
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        viewModel?.baseCurrency?.value = Double(textField.text ?? "0")
    }
    
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

        ])
        
    }
    
    func configure(item: Any?, isBaseCurrency: Bool = false){
        guard let item = item as? CurrencyConvertorViewModel else { return }
        self.viewModel = item
        let currencyItem: Currency? = isBaseCurrency ? item.baseCurrency : item.selectedCurrency
        if let item = currencyItem {
            currencyView.configure(currency: item)
            inputField.text = "\(item.value ?? 0)"
        }
        if(!isBaseCurrency) {
            backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.5547677654)
            inputField.textColor = .black
            currencyView.currencyLabel.textColor = .black
            inputField.isUserInteractionEnabled = false
            self.viewModel?.changeConvertValue = {
                let value = self.viewModel?.selectedCurrency?.value
                self.inputField.text = "\(value ?? 0)"
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
 
    
}

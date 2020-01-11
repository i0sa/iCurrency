//
//  TopCurrencyViewCell.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import UIKit

class TopCurrencyViewCell: UITableViewHeaderFooterView {

    lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 5
        return s
    }()
    
    lazy var currencyView: CurrencyView = {
        let c = CurrencyView(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        return c
    }()
    
//    lazy var bottomArrowImage: UIImageView = {
//        let image = UIImageView()
//        image.image = UIImage(named: "BottomArrow")
//        image.tintColor = .white
//        return image
//    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
//        self.contentView.backgroundColor = #colorLiteral(red: 0.9386721849, green: 0.9330919385, blue: 0.9429612756, alpha: 1)
        self.addSubview(stack)
        stack.addArrangedSubview(currencyView)
//        stack.addArrangedSubview(bottomArrowImage)

        setupConstraints()
    }
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 30),

        ])

    }
    
    func configure(item: Any?){
        guard let item = item as? Currency else { return }
        self.currencyView.configure(currency: item)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

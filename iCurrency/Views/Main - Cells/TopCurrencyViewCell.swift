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
    
    lazy var bottomArrowImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "BottomArrow")
        image.tintColor = .white
        return image
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    func setup(){
//        self.contentView.backgroundColor = UIColor(red:0.74, green:0.88, blue:0.90, alpha:1.0)
        self.contentView.backgroundColor = .white
        self.addSubview(stack)
        stack.addArrangedSubview(currencyView)
//        stack.addArrangedSubview(bottomArrowImage)

        setupConstraints()
    }
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        bottomArrowImage.translatesAutoresizingMaskIntoConstraints = false
        currencyView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            stack.heightAnchor.constraint(equalToConstant: 30),
            // Flag Image
            bottomArrowImage.widthAnchor.constraint(equalToConstant: 20),

        ])
        print(currencyView.frame)
        UIView.animate(withDuration: 0.3, animations: {
            self.layoutIfNeeded()
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

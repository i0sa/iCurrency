//
//  CurrencyView.swift
//  iCurrency
//
//  Created by Osama on 1/11/20.
//  Copyright © 2020 Osama Gamal. All rights reserved.
//

import Foundation
import UIKit

class CurrencyView: UIView{
    
    lazy var stack: UIStackView = {
        let s = UIStackView()
        s.axis = .horizontal
        s.spacing = 8
        return s
    }()
    
    lazy var flagImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "example")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    lazy var currencyLabel: UILabel = {
        let label = UILabel()
        label.text = "-"
        label.font = UIFont.init(name: "Proxima Nova", size: 30)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 0, height: 0))
        setup()
    }
    
    func setup(){
        self.addSubview(stack)
        stack.addArrangedSubview(flagImage)
        stack.addArrangedSubview(currencyLabel)

        setupConstraints()
    }
    
    func setupConstraints(){
        stack.translatesAutoresizingMaskIntoConstraints = false
        flagImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            // Stack
            stack.topAnchor.constraint(equalTo: self.topAnchor),
            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stack.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            // Flag Image
            flagImage.widthAnchor.constraint(equalToConstant: 40),

        ])
    }

    func configure(currency: Currency){
        if let currencyImage = CurrencyImage.getImage(for: currency) {
            flagImage.kf.indicatorType = .activity
            flagImage.kf.setImage(with: currencyImage)
        }
        currencyLabel.text = currency.currency

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

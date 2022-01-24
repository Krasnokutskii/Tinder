//
//  CardInfoLabel.swift
//  CardInfoLabel
//
//  Created by Yaroslav Krasnokutskiy on 24.01.2022.
//

import UIKit

class CardInfoLabel: UILabel{
    init(frame: CGRect, labelText: String, labelColor: UIColor) {
        super.init(frame: frame)

        font = .boldSystemFont(ofSize: 45)
        textColor = labelColor
        text = labelText
        
        layer.borderWidth = 2
        layer.cornerRadius = 10
        layer.borderColor = labelColor.cgColor
        
        textAlignment = .center
        alpha = 0
    }
    
    init(frame: CGRect,labelColor: UIColor, labelText: String, labelFont: UIFont){
        super.init(frame: frame)
        textColor = labelColor
        font = labelFont
        text = labelText
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

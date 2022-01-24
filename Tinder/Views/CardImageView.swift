//
//  CardImageView.swift
//  CardImageView
//
//  Created by Yaroslav Krasnokutskiy on 24.01.2022.
//

import UIKit

class CardImageView: UIImageView{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .blue
        layer.cornerRadius = 10
        image = UIImage(named: "test-image2")
        contentMode = .scaleAspectFill
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

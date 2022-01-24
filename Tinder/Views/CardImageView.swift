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
        //backgroundColor = .blue
        layer.cornerRadius = 15
        image = UIImage(named: "test-image2")
        contentMode = .scaleAspectFill
        clipsToBounds = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

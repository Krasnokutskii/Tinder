//
//  UIButton - Extansion.swift
//  UIButton - Extansion
//
//  Created by Yaroslav Krasnokutskiy on 24.01.2022.
//

import UIKit

extension UIButton{
    func createInfoButton()->UIButton{
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        self.setImage(UIImage(systemName: "info.circle",withConfiguration: configuration), for: .normal)
        self.tintColor = .white
        self.imageView?.contentMode = .scaleAspectFit
        return self
    }
}

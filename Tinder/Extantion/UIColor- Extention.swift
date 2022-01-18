//
//  UIColor- Extention.swift
//  UIColor- Extention
//
//  Created by Ярослав on 1/18/22.
//

import UIKit

extension UIColor{
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1)->UIColor{
        return UIColor.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

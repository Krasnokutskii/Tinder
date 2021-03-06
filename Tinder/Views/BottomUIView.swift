//
//  BottomUIView.swift
//  BottomUIView
//
//  Created by Ярослав on 1/11/22.
//

import UIKit

class BottomUIView: UIView {

    let reloadView = BottomButtonsView(frame: .zero, width: 50, imageSystemName: "gobackward", color: .systemYellow)
    let nopeView = BottomButtonsView(frame: .zero, width: 60, imageSystemName: "multiply",color: .red)
    let superLikeView = BottomButtonsView(frame: .zero, width: 50, imageSystemName: "star.fill", color: .blue)
    let likeView = BottomButtonsView(frame: .zero, width: 60, imageSystemName: "heart.fill", color: .green)
    let boostView = BottomButtonsView(frame: .zero, width: 50, imageSystemName: "bolt.fill", color: .purple)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
    
        let stackView = UIStackView(arrangedSubviews: [reloadView, nopeView, superLikeView, likeView, boostView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        stackView.anchors(top: topAnchor,bottom: bottomAnchor ,left: leftAnchor,right: rightAnchor, leftPudding: 10, rightPudding: 10)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BottomButtonsView: UIButton{
    
    var button: BottomButton?
    
    init(frame: CGRect, width: CGFloat, imageSystemName: String, color: UIColor) {
        super .init(frame: frame)
        button = BottomButton(type: .custom)
        //button?.setImage( UIImage(named: imageName)?.resize(size: .init(width: width * 0.4, height: width * 0.4)), for: .normal)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: width * 0.4)
        button?.setImage(UIImage(systemName: imageSystemName, withConfiguration: imageConfig), for: .normal)
        button?.tintColor = color
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width/2
        
        button?.layer.shadowOffset = .init(width: 2, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
        
        addSubview(button!)
        button?.anchors(centerX: centerXAnchor, centerY: centerYAnchor, width: width, height: width)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class BottomButton: UIButton{
    
    override var isHighlighted: Bool {
        didSet{
            if isHighlighted{
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .init(scaleX: 0.8, y: 0.8)
                    self.layoutIfNeeded()
                }
            }else{
                UIView.animate(withDuration: 0.3, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.7, options: []) {
                    self.transform = .identity
                    self.layoutIfNeeded()
                }
            }
        }
    }
    override init(frame: CGRect){
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  BottomUIView.swift
//  BottomUIView
//
//  Created by Ярослав on 1/11/22.
//

import UIKit

class BottomUIView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .purple
        
        let view1 = BottomButtonsView(frame: .zero, width: 50, imageName: "nope")
        let view2 = BottomButtonsView(frame: .zero, width: 60, imageName: "restart")
        let view3 = BottomButtonsView(frame: .zero, width: 50, imageName: "nope")
        let view4 = BottomButtonsView(frame: .zero, width: 60, imageName: "restart")
        let view5 = BottomButtonsView(frame: .zero, width: 50, imageName: "nope")
        
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3, view4, view5])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: topAnchor),
         stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 10),
         stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -10),].forEach{ $0.isActive = true }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

class BottomButtonsView: UIButton{
    
    var button: BottomButton?
    
    init(frame: CGRect, width: CGFloat, imageName: String) {
        super .init(frame: frame)
        button = BottomButton(type: .custom)
         button?.setImage( UIImage(named: imageName)?.resize(size: .init(width: width * 0.4, height: width * 0.4)), for: .normal)
        button?.translatesAutoresizingMaskIntoConstraints = false
        button?.backgroundColor = .white
        button?.layer.cornerRadius = width/2
        
        button?.layer.shadowOffset = .init(width: 2, height: 2)
        button?.layer.shadowColor = UIColor.black.cgColor
        button?.layer.shadowOpacity = 0.3
        button?.layer.shadowRadius = 15
        
        addSubview(button!)
        
        [button?.centerXAnchor.constraint(equalTo: centerXAnchor),
         button?.centerYAnchor.constraint(equalTo: centerYAnchor),
         button?.widthAnchor.constraint(equalToConstant: width),
         button?.heightAnchor.constraint(equalToConstant: width)].forEach{ $0?.isActive = true}
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

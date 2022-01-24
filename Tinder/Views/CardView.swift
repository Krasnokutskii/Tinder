//
//  CardView.swift
//  CardView
//
//  Created by Ярослав on 1/18/22.
//

import UIKit

class CardView: UIView{
    

    private let cardImageView = CardImageView(frame: .zero)
    
    private let infoButton = UIButton(type: .custom).createInfoButton()
    
    private let introductionLabel = CardInfoLabel(frame: .zero, labelColor: .white, labelText: "Hi,I'm really glad to be here", labelFont: .systemFont(ofSize: 20, weight: .regular))
    private let hobbyLabel = CardInfoLabel(frame: .zero, labelColor: .white, labelText: "Movie, Cybersport, Language", labelFont: .systemFont(ofSize: 20, weight: .regular))
    private let residenceLabel = CardInfoLabel(frame: .zero, labelColor: .white, labelText: "Russia, Nizniy Novgorod", labelFont: .systemFont(ofSize: 18, weight: .regular))
    private let nameLabel = CardInfoLabel(frame: .zero, labelColor: .white, labelText: "Rick 26", labelFont: .systemFont(ofSize: 40, weight: .regular))

    private let goodLabel: UILabel = CardInfoLabel(frame: .zero, labelText: "GOOD", labelColor: UIColor.rgb(red: 137, green: 223, blue: 86) )
    private let nopeLabel: UILabel = CardInfoLabel(frame: .zero, labelText: "NOPE", labelColor: UIColor.rgb(red: 222, green: 110, blue: 110))
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panCardView(gesture:)))
        self.addGestureRecognizer(panGesture)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func panCardView(gesture: UIPanGestureRecognizer){
        let translation = gesture.translation(in: self)
        if gesture.state == .changed{
            handlePanGesture(translation: translation)
        }
        
        if gesture.state == .ended{
            handlePanEnded()
        }
    }
    
    private func handlePanGesture(translation: CGPoint ){
        
        let degree = translation.x / 10
        let angle = degree * CGFloat.pi/180
       
        let rotationTranslation = CGAffineTransform(rotationAngle: angle)
        if translation.x < 0{
            nopeLabel.alpha = -translation.x/100
        }else {
            goodLabel.alpha = translation.x/100
        }
        self.transform = rotationTranslation.translatedBy(x: translation.x, y: translation.y)
    }
    
    
    
    private func handlePanEnded(){
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.7, options: []) {
            self.transform = .identity
            self.layoutIfNeeded()
            self.goodLabel.alpha = 0
            self.nopeLabel.alpha = 0 
        }

    }
    
    private func setUpLayout(){
        
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introductionLabel])
        infoVerticalStackView.axis = .vertical
        
        let basicHorizontalStack = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(basicHorizontalStack)
        addSubview(goodLabel)
        addSubview(nopeLabel)
        
        cardImageView.anchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPudding: 10, rightPudding: 10)
        nameLabel.anchors(bottom: basicHorizontalStack.topAnchor, left: cardImageView.leftAnchor, bottomPudding: 40, leftPudding: 10)
        infoButton.anchors(width: 40)
        basicHorizontalStack.anchors(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPudding: 20, leftPudding: 10, rightPudding: 20)
        goodLabel.anchors(top: cardImageView.topAnchor, left: cardImageView.leftAnchor, topPudding: 20, leftPudding: 20)
        nopeLabel.anchors(top: cardImageView.topAnchor, right: cardImageView.rightAnchor, topPudding: 20, rightPudding: 20)
    }
    
}

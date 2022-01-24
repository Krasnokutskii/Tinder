//
//  CardView.swift
//  CardView
//
//  Created by Ярослав on 1/18/22.
//

import UIKit

class CardView: UIView{
    
    let cardImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.layer.cornerRadius = 10
        iv.image = UIImage(named: "test-image")
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.text = "Rick 26"
        return label
    }()
    
    let residenceLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.text = "Russia, Nizniy Novgorod"
        return label
    }()
    let hobbyLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Movie, Cybersport, Language"
        return label
    }()
    let introductionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .regular)
        label.text = "Hi,I'm really glad to be here"
        return label
    }()
    
    let infoButton: UIButton = {
        let button = UIButton(type: .custom)
        let configuration = UIImage.SymbolConfiguration(pointSize: 40)
        button.setImage(UIImage(systemName: "info.circle",withConfiguration: configuration), for: .normal)
        button.tintColor = .white
        button.imageView?.contentMode = .scaleAspectFit
        return button
    }()
    
    let goodLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = UIColor.rgb(red: 137, green: 223, blue: 86)
        label.text = "GOOD"
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.rgb(red: 137, green: 223, blue: 86).cgColor
        
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    let nopeLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 45)
        label.textColor = UIColor.rgb(red: 222, green: 110, blue: 110)
        label.text = "NOPE"
        
        label.layer.borderWidth = 2
        label.layer.cornerRadius = 10
        label.layer.borderColor = UIColor.rgb(red: 222, green: 110, blue: 110).cgColor
        
        label.textAlignment = .center
        label.alpha = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //backgroundColor = .white
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
        nameLabel.anchors(bottom: basicHorizontalStack.topAnchor, left: cardImageView.leftAnchor, bottomPudding: 40, leftPudding: 20)
        infoButton.anchors(width: 40)
        basicHorizontalStack.anchors(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPudding: 20, leftPudding: 20, rightPudding: 20)
        goodLabel.anchors(top: cardImageView.topAnchor, left: cardImageView.leftAnchor, topPudding: 20, leftPudding: 20)
        nopeLabel.anchors(top: cardImageView.topAnchor, right: cardImageView.rightAnchor, topPudding: 20, rightPudding: 20)
    }
    
}

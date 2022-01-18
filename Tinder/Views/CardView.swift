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
        iv.contentMode = .scaleToFill
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
           // handlePanGesture(translation: translation)
            self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)

        }
        
        if gesture.state == .ended{
            UIView.animate(withDuration: 0.3) {
                self.transform = .identity
            }
        }
    }
    
//    private func handlePanGesture(translation: CGPoint ){
//
//        let degree = translation.x / 20
//        let angle =
//        self.transform = CGAffineTransform(translationX: translation.x, y: translation.y)
//    }
    
    private func setUpLayout(){
        
        let infoVerticalStackView = UIStackView(arrangedSubviews: [residenceLabel, hobbyLabel, introductionLabel])
        infoVerticalStackView.axis = .vertical
        
        let basicHorizontalStack = UIStackView(arrangedSubviews: [infoVerticalStackView, infoButton])
        
        addSubview(cardImageView)
        addSubview(nameLabel)
        addSubview(basicHorizontalStack)
        
        
        cardImageView.anchors(top: topAnchor, bottom: bottomAnchor, left: leftAnchor, right: rightAnchor, leftPudding: 10, rightPudding: 10)
        nameLabel.anchors(bottom: basicHorizontalStack.topAnchor, left: cardImageView.leftAnchor, bottomPudding: 40, leftPudding: 20)
        infoButton.anchors(width: 40)
        basicHorizontalStack.anchors(bottom: cardImageView.bottomAnchor, left: cardImageView.leftAnchor, right: cardImageView.rightAnchor, bottomPudding: 20, leftPudding: 20, rightPudding: 20)
    }
    
}

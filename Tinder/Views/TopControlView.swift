//
//  TopControlView.swift
//  TopControlView
//
//  Created by Ярослав on 1/13/22.
//

import UIKit
import RxCocoa
import RxSwift

class TopControlView: UIView{
    
    let disposeBag = DisposeBag()
    let tinderButton = createTopButton(imageName: "flame.fill")
    let goodButton = createTopButton(imageName: "suit.diamond.fill")
    let commentButton = createTopButton(imageName: "message.fill")
    let profileButton = createTopButton(imageName: "person.fill")
    
    static private func createTopButton(imageName: String)-> UIButton{
        let button = UIButton(type: .custom)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 72)
        //let colorConfig = UIImage.SymbolConfiguration.configurationPreferringMulticolor() // change Color here
        button.setImage(UIImage.init(systemName: imageName ,withConfiguration: imageConfig), for: .normal)
        button.setImage(UIImage.init(systemName: imageName ,withConfiguration: imageConfig), for: .selected)
        button.imageView?.contentMode = .scaleAspectFit
        button.tintColor = .lightGray
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpLayout()
        setUpBindings()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpLayout(){
        backgroundColor = .purple
        
        let stackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 40
        stackView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: topAnchor),
         stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
         stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40),].forEach{ $0.isActive = true }
    }
    
    private func setUpBindings(){
        tinderButton.rx.tap
            .subscribe { _ in
            self.handleSelection(selectedButton: self.tinderButton)
        }.disposed(by: disposeBag)
        
        goodButton.rx.tap
            .subscribe { _ in
                self.handleSelection(selectedButton: self.goodButton)
        }.disposed(by: disposeBag)
        
        commentButton.rx.tap
            .subscribe { _ in
                self.handleSelection(selectedButton: self.commentButton)
        }.disposed(by: disposeBag)
        
        profileButton.rx.tap
            .subscribe { _ in
                self.handleSelection(selectedButton: self.profileButton)
        }.disposed(by: disposeBag)
        

    }
    
    func handleSelection(selectedButton: UIButton){
        let buttons = [tinderButton, goodButton, commentButton, profileButton]
        
        buttons.forEach{ button in
            if button == selectedButton{
                button.isSelected = true
                if  button == goodButton{
                    button.tintColor = .yellow}
                else {
                    button.tintColor = .red
                }
                
            }else {
                button.isSelected = false
                button.tintColor = .lightGray
            }
            
        }
    }
    
}
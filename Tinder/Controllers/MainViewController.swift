//
//  ViewController.swift
//  Tinder
//
//  Created by Ярослав on 1/11/22.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let topControlView = TopControlView()
        
        let view2 = CardView()// card view
        
        let BottomControlView = BottomUIView()
        
     
        let stackView = UIStackView(arrangedSubviews: [topControlView, view2, BottomControlView])
        stackView.axis = .vertical
        stackView.backgroundColor = .white
        //stackView.distribution = .fillEqually
        stackView.alignment = .fill
        //stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(stackView)
        
        [
         topControlView.heightAnchor.constraint(equalToConstant: (view.frame.height / 9)),
         BottomControlView.heightAnchor.constraint(equalToConstant: (view.frame.height / 8)),
         stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)].forEach{ $0.isActive = true}

    }


}


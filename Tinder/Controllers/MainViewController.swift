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
        let view1 = UIView()
        view1.backgroundColor = .yellow
        
        let view2 = UIView()
        view2.backgroundColor = .blue
        
        let view3 = BottomUIView()
        
     
        let stackView = UIStackView(arrangedSubviews: [view1, view2, view3])
        stackView.axis = .vertical
        //stackView.distribution = .fillEqually
        stackView.alignment = .fill
        //stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(stackView)
        
        [
            view1.heightAnchor.constraint(equalToConstant: (view.frame.height / 8)),
            view3.heightAnchor.constraint(equalToConstant: (view.frame.height / 8)),
         stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)].forEach{ $0.isActive = true}

    }


}


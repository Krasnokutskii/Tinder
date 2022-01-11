//
//  ViewController.swift
//  Tinder
//
//  Created by Ярослав on 1/11/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let view1 = UIView()
        view1.backgroundColor = .yellow
        
        let view2 = UIView()
        view1.backgroundColor = .blue
        
        let view3 = UIView()
        view1.backgroundColor = .green
     
        let stackView = UIStackView(arrangedSubviews: [view3, view2, view1])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        view.addSubview(stackView)
        
        [stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)].forEach{ $0.isActive = true}

    }


}


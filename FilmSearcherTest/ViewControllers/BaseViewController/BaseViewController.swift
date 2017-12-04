//
//  BaseViewController.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - lazy init -
    
    lazy var router : Router = {
        Router(navigationController: self.navigationController)
    }()
    
    //MARK: - Actions -
    
    @objc func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Protected -
    
    func customizeBackButton() {
        addNavigationBarItemWith(#imageLiteral(resourceName: "backRegistrButton"), isLeft: true, target: self, selector: #selector (goBack))
    }
}

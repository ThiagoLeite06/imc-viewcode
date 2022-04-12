//
//  HomeViewController.swift
//  IMC
//
//  Created by Thiago Leite on 10/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    var home: Home?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    //MARK: - Helpers
    func configureUI() {
        self.home = Home()
        self.view = home
        home?.delegate = self
        view.backgroundColor = .white
    }
}

extension HomeViewController: HomeDelegate {
    
    
    func calculate() {
        print("Foi do protocolo =======")
    }
    
    
}

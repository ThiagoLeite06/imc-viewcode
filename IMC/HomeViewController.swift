//
//  HomeViewController.swift
//  IMC
//
//  Created by Thiago Leite on 10/04/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    private let home = Home()
    var imc: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    

    //MARK: - Helpers
    func configureUI() {
        view = home
        home.delegate = self
        view.backgroundColor = .white
    }
    
}

extension HomeViewController: HomeDelegate {
    
    func calculate(weight: Double, height: Double) {
        self.imc = weight / (height*height)
        showResult(imcResult: imc)
    }
    
    func showResult(imcResult: Double) {
        switch imcResult{
        case 0..<16:
            home.responseLabel.text = "Magreza"
        case 16..<18.5:
            home.responseLabel.text = "Abaixo do peso"
        case 18.5..<25:
            home.responseLabel.text = "Peso Ideal"
        case 25..<30:
            home.responseLabel.text = "Sobrepeso"
        default:
            home.responseLabel.text = "Obesidade"
        }
    }
}

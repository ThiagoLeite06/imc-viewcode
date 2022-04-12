//
//  Home.swift
//  IMC
//
//  Created by Thiago Leite on 10/04/22.
//

import UIKit

protocol HomeDelegate: AnyObject {
    func calculate()
}

class Home: UIView {
    
    var delegate: HomeDelegate?
    
    //MARK: - Components
    
    private let title: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cálculo do IMC"
        label.textAlignment = .center
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        
        return label
    }()
    
    private let subTitle: UILabel = {
        let subTitle = UILabel()
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.text = "Descubra seu índice de Massa Corporal"
        subTitle.textAlignment = .center
        subTitle.font = UIFont.preferredFont(forTextStyle: .caption1)
       
        return subTitle
    }()
    
    private var fieldsStackView: UIStackView = {
        let fieldsStackView = UIStackView()
        fieldsStackView.translatesAutoresizingMaskIntoConstraints = false
        fieldsStackView.axis = .horizontal
        fieldsStackView.distribution = .fillEqually
        fieldsStackView.spacing = 10

        return fieldsStackView
    }()
    
    private var weightStackView: UIStackView =  {
        let weightStackView = UIStackView()
        weightStackView.translatesAutoresizingMaskIntoConstraints = false
        weightStackView.axis = .vertical
        weightStackView.distribution = .fillProportionally

        return weightStackView
    }()

    private var heightStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally

        return stackView
    } ()

    private let weightLabel: UILabel = {
        let weight = UILabel()
        weight.translatesAutoresizingMaskIntoConstraints = false
        weight.text = "Peso (Kg)"
        weight.textAlignment = .center
        weight.font = UIFont.preferredFont(forTextStyle: .caption2)

        return weight
    }()

    private let heightLabel: UILabel = {
        let height = UILabel()
        height.translatesAutoresizingMaskIntoConstraints = false
        height.text = "Altura (m)"
        height.textAlignment = .center
        height.font = UIFont.preferredFont(forTextStyle: .caption2)

        return height
    }()

    private let weightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ex.: 75"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()

    private let heightTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ex.: 1,75"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private let calcButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("Calcular", for: .normal)
        btn.backgroundColor = .systemBlue
        btn.clipsToBounds = true
        btn.layer.cornerRadius = 7.5
        btn.addTarget(self, action: #selector(actionCalculateButton), for: .touchUpInside)
        
        return btn
    }()
    
    
    private let responseLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Teste"
        
        return label
    }()
    
    //MARK: - Methods
    
     @objc func actionCalculateButton() {
         delegate?.calculate()
     }
    
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpSubViews()
        configureStackView()
        setUpConstraints()
       
    }
    
    func configureStackView() {
        fieldsStackView.addArrangedSubview(weightStackView)
        fieldsStackView.addArrangedSubview(heightStackView)
        
        weightStackView.addArrangedSubview(weightLabel)
        weightStackView.addArrangedSubview(weightTextField)
        
        heightStackView.addArrangedSubview(heightLabel)
        heightStackView.addArrangedSubview(heightTextField)
        
    }
    
    private func setUpSubViews() {
        addSubview(title)
        addSubview(subTitle)
        addSubview(fieldsStackView)
        addSubview(calcButton)
        addSubview(responseLabel)
        

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Constraints
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 18),
            title.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -18),
            
            subTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 12),
            subTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 18),
            subTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -18),
            
            fieldsStackView.topAnchor.constraint(equalTo: subTitle.bottomAnchor, constant: 18),
            fieldsStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            fieldsStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            fieldsStackView.heightAnchor.constraint(equalToConstant: 70),
            
            weightStackView.widthAnchor.constraint(equalToConstant: 100),
            heightStackView.widthAnchor.constraint(equalToConstant: 100),
            
            calcButton.topAnchor.constraint(equalTo: fieldsStackView.bottomAnchor, constant: 32),
            calcButton.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            calcButton.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            responseLabel.topAnchor.constraint(equalTo: calcButton.bottomAnchor, constant: 100),
            responseLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 28),
            responseLabel.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -28),
            
            
            
        ])
    }
}

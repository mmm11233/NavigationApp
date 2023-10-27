//
//  colorPaletteViewController.swift
//  navigationApp
//
//  Created by Mariam Joglidze on 27.10.23.
//

import UIKit

class ColorPaletteViewController: UIViewController {
    
    weak var delegate: FirstVCDelegate?
    
    let label1 = UILabel()
    let label2 = UILabel()
    let buttonStackView1 = UIStackView()
    let buttonStackView2 = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupUI()
    }
    
    func setupUI() {
        setupLabels()
        setupButtonStackViews()
        setupConstraints()
        setupButtonTargets()
    }
    
    func setupLabels() {
        label1.text = "Change Home Buttons Background Colors"
        label1.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label1)
        
        label2.text = "Change Home Background Color"
        label2.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label2)
    }
    
    func setupButtonStackViews() {
        buttonStackView1.axis = .horizontal
        buttonStackView1.spacing = 10
        buttonStackView1.distribution = .fillEqually
        
        buttonStackView2.axis = .horizontal
        buttonStackView2.spacing = 10
        buttonStackView2.distribution = .fillEqually
        
        let buttonColors: [UIColor] = [.red, .systemPink, .gray, .yellow, .purple, .black]
        
        for color in buttonColors {
            let button1 = UIButton()
            button1.backgroundColor = color
            buttonStackView1.addArrangedSubview(button1)
            button1.heightAnchor.constraint(equalToConstant: 55).isActive = true

            let button2 = UIButton()
            button2.backgroundColor = color
            buttonStackView2.addArrangedSubview(button2)
            button2.heightAnchor.constraint(equalToConstant: 55).isActive = true

        }
        
        buttonStackView1.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView2.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(buttonStackView1)
        view.addSubview(buttonStackView2)
    }
    
    func setupConstraints() {
        let verticalSpacing: CGFloat = 50
        
        NSLayoutConstraint.activate([
            label1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: verticalSpacing),
            label1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonStackView1.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 17),
            buttonStackView1.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView1.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            

            
            label2.topAnchor.constraint(equalTo: buttonStackView1.bottomAnchor, constant: verticalSpacing),
            label2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            buttonStackView2.topAnchor.constraint(equalTo: label2.bottomAnchor, constant: 17),
            buttonStackView2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            buttonStackView2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

        ])
    }
    
    func setupButtonTargets() {
        for button in buttonStackView1.arrangedSubviews + buttonStackView2.arrangedSubviews {
            if let button = button as? UIButton {
                button.addTarget(self, action: #selector(colorButtonTapped(_:)), for: .touchUpInside)
            }
        }
    }
    
    @objc func colorButtonTapped(_ sender: UIButton) {
        if let color = sender.backgroundColor {
            delegate?.changeColor(using: color)
            navigationController?.popViewController(animated: true)
        }
    }
}

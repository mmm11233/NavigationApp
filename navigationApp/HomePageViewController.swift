//
//  ViewController.swift
//  navigationApp
//
//  Created by Mariam Joglidze on 27.10.23.
//

import UIKit

protocol FirstVCDelegate: AnyObject {
    func changeColor(using color: UIColor)
}

class HomePageViewController: UIViewController, FirstVCDelegate{
    func changeColor(using color: UIColor) {
        view.backgroundColor = color
    }
    
    let buttonStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    private var presentButton = UIButton()
    private var pushbutton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpButtonStackView()
        presentButton.addTarget(self, action: #selector(pushButtonTapped), for: .touchUpInside)
        pushbutton.addTarget(self, action: #selector(presentButtonTapped), for: .touchUpInside)
        
        view.backgroundColor = .white
    }
    
    @objc func pushButtonTapped() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        navigationController?.pushViewController(colorPaletteViewController, animated: true)
    }
    
    @objc func presentButtonTapped() {
        let colorPaletteViewController = ColorPaletteViewController()
        colorPaletteViewController.delegate = self
        navigationController?.present(colorPaletteViewController, animated: true)
    }
    
    func setUpButtonStackView() {
        buttonStackView.axis = .vertical
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 20
        
        let pushButton = UIButton()
        pushButton.setTitle("present Color Palette Page", for: .normal)
        pushButton.setTitleColor(.white, for: .normal)
        pushButton.backgroundColor = .purple
        pushButton.layer.cornerRadius = 8
        pushButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        pushButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.pushbutton = pushButton
        
        let presentButton = UIButton()
        presentButton.setTitle("push Color Palette Page", for: .normal)
        presentButton.setTitleColor(.white, for: .normal)
        presentButton.backgroundColor = .systemPink
        presentButton.layer.cornerRadius = 8
        presentButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        presentButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        self.presentButton = presentButton
        
        buttonStackView.addArrangedSubview(pushButton)
        buttonStackView.addArrangedSubview(presentButton)
        
        view.addSubview(buttonStackView)
        
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
  






    

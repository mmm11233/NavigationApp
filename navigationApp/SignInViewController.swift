//
//  ViewController.swift
//  navigationApp
//
//  Created by Mariam Joglidze on 27.10.23.
//

import UIKit

class SignInViewController: UIViewController {
    
    let presentImage: UIImageView = {
        let imageName = "Rectangle 4"
        let image = UIImage(named: imageName)
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    
    let presentStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let presentSecondStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    private var emailTextField: UITextField?  = nil
    private var passwordTextField: UITextField? = nil
    
    let signInButton: UIButton =  {
        let button = UIButton()
        
        return button
    }()
    
    let presentThirdStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let presentFourthStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    let presentFifthStackView: UIStackView = {
        let stackView = UIStackView()
        
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupPresentImage()
        setUpStackView()
        setUpSecondStackView()
        setupSignInhBtn()
        setUpLineView()
        setUpAppsView()
        setUpSignUpInfo()
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
    }
    
    
    @objc func signInButtonTapped() {
        if  emailTextField?.text?.isEmpty == false && passwordTextField?.text?.isEmpty == false {
            let homePageViewController = HomePageViewController()
            navigationController?.pushViewController(homePageViewController, animated: true)
        } else {
            let alert = UIAlertController(title: "Error", message: "Both email and password are required.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
        }
    }
    //MARK: - Setup UI
    func setupPresentImage() {
        view.addSubview(presentImage)
        
        NSLayoutConstraint.activate([
            presentImage.topAnchor.constraint(equalTo: view.topAnchor),
            presentImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            presentImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            presentImage.heightAnchor.constraint(equalTo: presentImage.widthAnchor, multiplier: 1.0)
        ])
    }
    
    func setUpStackView() {
        presentStackView.axis = .vertical
        presentStackView.alignment = .center
        presentStackView.distribution = .equalSpacing
        presentStackView.spacing = 8
        
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Ellipse 29")
        imageView.widthAnchor.constraint(equalToConstant: 160).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 160).isActive = true
        
        let label = UILabel()
        label.text = "Sign In"
        
        presentStackView.addArrangedSubview(imageView)
        presentStackView.addArrangedSubview(label)
        
        view.addSubview(presentStackView)
        
        presentStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
        ])
    }
    
    func setUpSecondStackView() {
        presentSecondStackView.axis = .vertical
        presentSecondStackView.alignment = .center
        presentSecondStackView.distribution = .equalSpacing
        presentSecondStackView.spacing = 15
        
        let emailTextField = UITextField()
        emailTextField.placeholder = "Email"
        emailTextField.backgroundColor = UIColor(hexString: "#F8F8F8")
        emailTextField.layer.cornerRadius = 16
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        self.emailTextField = emailTextField
        
        let emailLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: emailTextField.frame.size.height))
        let emailLabel = UILabel()
        emailLabel.text = "Email"
        emailLabel.frame = CGRect(x: 0, y: 0, width: 16, height: emailTextField.frame.size.height)
        emailLeftView.addSubview(emailLabel)
        emailTextField.leftView = emailLeftView
        emailTextField.leftViewMode = .always
        
        let passwordTextField = UITextField()
        passwordTextField.placeholder = "Password"
        passwordTextField.backgroundColor = UIColor(hexString: "#F8F8F8")
        passwordTextField.layer.cornerRadius = 16
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordLeftView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: passwordTextField.frame.size.height))
        let passwordLabel = UILabel()
        passwordLabel.text = "Password"
        passwordLabel.frame = CGRect(x: 0, y: 0, width: 16, height: passwordTextField.frame.size.height)
        passwordLeftView.addSubview(passwordLabel)
        passwordTextField.leftView = passwordLeftView
        passwordTextField.leftViewMode = .always
        self.passwordTextField = passwordTextField
        
        let forgotPasswordLabel = UILabel()
        forgotPasswordLabel.text = "Forgot Your Password?"
        forgotPasswordLabel.textColor = UIColor(hexString: "#5F5F5F")
        forgotPasswordLabel.font = UIFont.systemFont(ofSize: 14)
        forgotPasswordLabel.textAlignment = NSTextAlignment(.right)
        
        presentSecondStackView.addArrangedSubview(emailTextField)
        presentSecondStackView.addArrangedSubview(passwordTextField)
        presentSecondStackView.addArrangedSubview(forgotPasswordLabel)
        
        view.addSubview(presentSecondStackView)
        
        presentSecondStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentSecondStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            presentSecondStackView.topAnchor.constraint(equalTo: presentStackView.bottomAnchor, constant: 32),
            presentSecondStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 52),
            presentSecondStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -52),
            emailTextField.widthAnchor.constraint(equalToConstant: 289),
            emailTextField.heightAnchor.constraint(equalToConstant: 53),
            passwordTextField.widthAnchor.constraint(equalToConstant: 289),
            passwordTextField.heightAnchor.constraint(equalToConstant: 53)
        ])
    }
    
    func setupSignInhBtn() {
        signInButton.setTitle("Sign In", for: .normal)
        signInButton.backgroundColor = UIColor(hexString: "#22577A")
        signInButton.layer.cornerRadius = 23
        view.addSubview(signInButton)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: presentSecondStackView.bottomAnchor, constant: 32),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50.5),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50.5),
            signInButton.heightAnchor.constraint(equalToConstant: 45)
            
        ])
        
    }
    
    func setUpLineView() {
        presentThirdStackView.axis = .horizontal
        presentThirdStackView.alignment = .center
        presentThirdStackView.distribution = .equalCentering
        presentThirdStackView.spacing = 8
        
        let firstView = UIView()
        firstView.backgroundColor = UIColor(hexString: "#5F5F5F")
        firstView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        let orLabel = UILabel()
        orLabel.text = "Or"
        orLabel.textColor = UIColor(hexString: "#5F5F5F")
        orLabel.font = UIFont.systemFont(ofSize: 14)
        orLabel.widthAnchor.constraint(equalToConstant: 16).isActive = true
        orLabel.heightAnchor.constraint(equalToConstant: 17).isActive = true
        
        let secondView = UIView()
        secondView.backgroundColor = UIColor(hexString: "#5F5F5F")
        secondView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: 120).isActive = true
        
        presentThirdStackView.addArrangedSubview(firstView)
        presentThirdStackView.addArrangedSubview(orLabel)
        presentThirdStackView.addArrangedSubview(secondView)
        
        view.addSubview(presentThirdStackView)
        orLabel.centerXAnchor.constraint(equalTo: presentThirdStackView.centerXAnchor).isActive = true
        
        presentThirdStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentThirdStackView.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 32),
            presentThirdStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60.5),
            presentThirdStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -60.5),
        ])
    }
    func setUpAppsView() {
        
        presentFourthStackView.axis = .horizontal
        presentFourthStackView.alignment = .center
        presentFourthStackView.distribution = .fillEqually
        presentFourthStackView.spacing = 11
        
        let imageView1 = UIImageView(image: UIImage(named: "Frame 10"))
        presentFourthStackView.addArrangedSubview(imageView1)
        
        let imageView2 = UIImageView(image: UIImage(named: "Frame 11"))
        presentFourthStackView.addArrangedSubview(imageView2)
        
        let imageView3 = UIImageView(image: UIImage(named: "Frame 12"))
        presentFourthStackView.addArrangedSubview(imageView3)
        
        view.addSubview(presentFourthStackView)
        
        presentFourthStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentFourthStackView.topAnchor.constraint(equalTo: presentThirdStackView.bottomAnchor, constant: 14),
            presentFourthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 122.5),
            presentFourthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -122.5),
            imageView1.widthAnchor.constraint(equalToConstant: 42),
            imageView1.heightAnchor.constraint(equalToConstant: 42),
            imageView2.widthAnchor.constraint(equalToConstant: 42),
            imageView2.heightAnchor.constraint(equalToConstant: 42),
            imageView3.widthAnchor.constraint(equalToConstant: 42),
            imageView3.heightAnchor.constraint(equalToConstant: 42),
        ])
    }
    
    func setUpSignUpInfo() {
        presentFifthStackView.axis = .horizontal
        presentFifthStackView.alignment = .center
        presentFifthStackView.distribution = .equalSpacing
        presentFifthStackView.spacing = 8
        // Create the first label ("Don't have an account.")
        let label1 = UILabel()
        label1.text = "Don't have an account."
        label1.textColor = UIColor(hexString: "#5F5F5F")
        label1.font = UIFont.systemFont(ofSize: 12)
        label1.sizeToFit()
        
        // Create the second label ("Sign Up")
        let label2 = UILabel()
        label2.text = "Sign Up"
        label2.textColor = UIColor(hexString: "#22577A")
        label2.font = UIFont.systemFont(ofSize: 12)
        label2.sizeToFit()
        
        // Add the labels to the stack view
        presentFifthStackView.addArrangedSubview(label1)
        presentFifthStackView.addArrangedSubview(label2)
        
        // Add the label stack view to the view hierarchy
        view.addSubview(presentFifthStackView)
        
        // Create Auto Layout constraints for the label stack view
        presentFifthStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            presentFifthStackView.topAnchor.constraint(equalTo: presentFourthStackView.bottomAnchor, constant: 65), // Offset from the stack view above
            presentFifthStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 95),
            presentFifthStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -95),
        ])
    }
    
}
    


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}



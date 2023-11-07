//
//  ViewController.swift
//  Assignment_12
//
//  Created by Macbook Air 13 on 28.10.23.
//

import UIKit

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    private let signInMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 65
        
        return stackView
    }()
    
    private let signInDisplayStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 32
        
        return stackView
    }()
    
    private let titleStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "jobs")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 80
        
        return imageView
    }()
    
    private let signInLabel: UILabel = {
        let label = UILabel()
        label.text = "Sign In"
        label.font = UIFont(name: "Helvetica-Bold", size: 28.0)
        
        return label
    }()
    
    private let textInputStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 15
        
        return stackView
    }()
    
    private let emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 16
        textField.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.clipsToBounds = true
        textField.layer.cornerRadius = 16
        textField.layer.borderColor = UIColor(red: 0.698, green: 0.698, blue: 0.698, alpha: 0.25).cgColor
        textField.layer.borderWidth = 1
        textField.backgroundColor = UIColor(red: 0.973, green: 0.973, blue: 0.973, alpha: 1)
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 15, height: textField.frame.height))
        textField.leftViewMode = .always
        
        return textField
    }()
    
    private let forgotPasswordLabel: UILabel = {
        let label = UILabel()
        label.text = "Forgot Your Password?"
        label.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.textAlignment = .right
        
        return label
    }()
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign In", for: .normal)
        button.titleLabel?.font = UIFont(name: "Helvetica", size: 15)
        button.backgroundColor = UIColor(red: 0.133, green: 0.341, blue: 0.478, alpha: 1)
        button.layer.cornerRadius = 22.5
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        return button
    }()
    
    private let signInAlternativesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.alignment = .center
        
        return stackView
    }()
    
    private let orStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    
    private let leftLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.text = "Or"
        label.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.textAlignment = .center
        
        return label
    }()
    
    private let rightLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        view.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        return view
    }()
    
    private let socialNetworksStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 11
        
        return stackView
    }()
    
    private let googleButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "devicon_google"), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 12
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    private let facebookButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "bxl_facebook"), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 12
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    private let linkedinButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.setBackgroundImage(UIImage(named: "devicon_linkedin"), for: .normal)
        button.layer.cornerRadius = 8
        button.layer.shadowColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.12).cgColor
        button.layer.shadowOpacity = 1
        button.layer.shadowRadius = 12
        button.layer.shadowOffset = CGSize(width: 0, height: 4)
        
        return button
    }()
    
    private let signUpSuggestionLabel: UILabel = {
        let label = UILabel()
        label.text = "Don’t have an account.Sign Up"
        label.textColor = UIColor(red: 0.373, green: 0.373, blue: 0.373, alpha: 1)
        label.font = UIFont(name: "Helvetica", size: 14.0)
        label.textAlignment = .center
        
        return label
    }()
    

    // MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    
    // MARK: - setupUI
    private func setupUI() {
        view.backgroundColor = .white
        setupMainStackView()
        configureMainStackView()
        addButtonActions()
    }
    
    
    // MARK: - Private Methods
    private func setupMainStackView() {
        view.addSubview(signInMainStackView)
        setupMainStackViewConstraints()
        setupMainStackViewMargins()
    }
    
    private func configureMainStackView() {
        signInMainStackView.addArrangedSubview(signInDisplayStackView)
        configureSignInDisplayStackView()
        signInMainStackView.addArrangedSubview(signUpSuggestionLabel)
    }
    
    private func configureSignInDisplayStackView() {
        signInDisplayStackView.addArrangedSubview(titleStackView)
        signInDisplayStackView.addArrangedSubview(textInputStackView)
        signInDisplayStackView.addArrangedSubview(signInButton)
        signInDisplayStackView.addArrangedSubview(signInAlternativesStackView)
        configureTitleStackView()
        configureTextInputStackView()
        configureSignInAlternativesStackView()
    }
    
    private func configureTitleStackView() {
        titleStackView.addArrangedSubview(profileImageView)
        titleStackView.addArrangedSubview(signInLabel)
        setupProfileImageViewConstraints()
    }
    
    private func configureTextInputStackView() {
        textInputStackView.addArrangedSubview(emailTextField)
        textInputStackView.addArrangedSubview(passwordTextField)
        textInputStackView.addArrangedSubview(forgotPasswordLabel)
        setupTextFieldSizeConstraints()
    }
    
    private func configureSignInAlternativesStackView() {
        signInAlternativesStackView.addArrangedSubview(orStackView)
        signInAlternativesStackView.addArrangedSubview(socialNetworksStackView)
        configureOrStackView()
        configureSocialNetworksStackView()
    }
    
    private func configureOrStackView() {
        orStackView.addArrangedSubview(leftLine)
        orStackView.addArrangedSubview(orLabel)
        orStackView.addArrangedSubview(rightLine)
    }
    
    private func configureSocialNetworksStackView() {
        socialNetworksStackView.addArrangedSubview(googleButton)
        socialNetworksStackView.addArrangedSubview(facebookButton)
        socialNetworksStackView.addArrangedSubview(linkedinButton)
        setSocialNetworkButtonConstraints()
    }
    
    private func addButtonActions() {
        signInButton.addAction(UIAction(handler: { [weak self] _ in
            let emailText = self?.emailTextField.text
            let passwordText = self?.passwordTextField.text
            
            if emailText != "" && passwordText != "" {
                self?.navigateToHomePage()
            } else {
                self?.emailTextField.text = ""
                self?.passwordTextField.text = ""
            }
            
        }), for: .touchUpInside)
    }
    
    private func navigateToHomePage() {
        let homePage = HomePageViewController()
        self.navigationController?.pushViewController(homePage, animated: true)
    }
    
    
    // MARK: - Constraints and Margins
    private func setupMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            signInMainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            signInMainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            signInMainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        ])
    }
    
    private func setupMainStackViewMargins() {
        signInMainStackView.isLayoutMarginsRelativeArrangement = true
        signInMainStackView.layoutMargins = UIEdgeInsets(top: 32, left: 50.5, bottom: 32, right: 50.5)
    }
    
    private func setupProfileImageViewConstraints() {
        NSLayoutConstraint.activate([
            profileImageView.widthAnchor.constraint(equalToConstant: 160),
            profileImageView.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    private func setupTextFieldSizeConstraints() {
        NSLayoutConstraint.activate([
            emailTextField.heightAnchor.constraint(equalToConstant: 53),
            passwordTextField.heightAnchor.constraint(equalToConstant: 53)
        ])
    }
    
    private func setSocialNetworkButtonConstraints() {
        NSLayoutConstraint.activate([
            googleButton.heightAnchor.constraint(equalToConstant: 42),
            googleButton.widthAnchor.constraint(equalToConstant: 42),
            facebookButton.heightAnchor.constraint(equalToConstant: 42),
            facebookButton.widthAnchor.constraint(equalToConstant: 42),
            linkedinButton.heightAnchor.constraint(equalToConstant: 42),
            linkedinButton.widthAnchor.constraint(equalToConstant: 42)
        ])
    }
    
    
}


//
//  HomePageViewController.swift
//  Assignment_12
//
//  Created by Macbook Air 13 on 07.11.23.
//

import UIKit

protocol Delegate {
    func changeButtonColors(color: UIColor)
    func changeBackgroundColor(color: UIColor)
}

extension HomePageViewController: Delegate {
    func changeButtonColors(color: UIColor) {
        self.presentButton.backgroundColor = color
        self.pushButton.backgroundColor = color
    }
    
    func changeBackgroundColor(color: UIColor) {
        self.view.backgroundColor = color
    }
}

class HomePageViewController: UIViewController {

    // MARK: - Properties
    private let homePageMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        
        return stackView
    }()
    
    private let presentButton: UIButton = {
        let button = UIButton()
        button.setTitle("Present", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let pushButton: UIButton = {
        let button = UIButton()
        button.setTitle("Push", for: .normal)
        button.backgroundColor = .black
        button.setTitleColor(.white, for: .normal)
        
        return button
    }()
    
    private let colorPalettePage = ColorPaletteViewController()
    
    
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
        view.addSubview(homePageMainStackView)
        setupHomePageMainStackViewConstraints()
    }
    
    private func configureMainStackView() {
        homePageMainStackView.addArrangedSubview(presentButton)
        homePageMainStackView.addArrangedSubview(pushButton)
        addButtonConstraints()
    }
    
    private func addButtonActions() {
        presentButton.addAction(UIAction(handler: { [weak self] _ in
            self?.presentColorPalettePage()
            
        }), for: .touchUpInside)
        
        pushButton.addAction(UIAction(handler: { [weak self] _ in
            self?.pushToColorPalettePage()
            
        }), for: .touchUpInside)
        
        colorPalettePage.delegate = self
    }
    
    private func presentColorPalettePage() {
        present(colorPalettePage, animated: true)
    }
    
    private func pushToColorPalettePage() {
        self.navigationController?.pushViewController(colorPalettePage, animated: true)
    }
    
    
    // MARK: - Constraints
    private func setupHomePageMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            homePageMainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            homePageMainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func addButtonConstraints() {
        NSLayoutConstraint.activate([
            presentButton.heightAnchor.constraint(equalToConstant: 50),
            presentButton.widthAnchor.constraint(equalToConstant: 150),
            pushButton.heightAnchor.constraint(equalToConstant: 50),
            pushButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}

//
//  ColorPaletteViewController.swift
//  Assignment_12
//
//  Created by Macbook Air 13 on 07.11.23.
//

import UIKit

class ColorPaletteViewController: UIViewController {

    // MARK: - Properties
    private let possibleButtonColors: [UIColor] = [
        // Black
        UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1),
        // Red
        UIColor(red: 255/255, green: 0/255, blue: 0/255, alpha: 1),
        // Orange
        UIColor(red: 255/255, green: 165/255, blue: 0/255, alpha: 1),
        // Yellow
        UIColor(red: 255/255, green: 255/255, blue: 204/255, alpha: 1),
        // Green
        UIColor(red: 0/255, green: 255/255, blue: 0/255, alpha: 1),
        // Purple
        UIColor(red: 128/255, green: 0/255, blue: 128/255, alpha: 1)
    ]
    
    private let colorPaletteMainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let changeButtonColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Buttons' Color"
        label.font = UIFont(name: "Helvetica", size: 25.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let buttonColorChangersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    private let changeBackgroundColorLabel: UILabel = {
        let label = UILabel()
        label.text = "Change Background's Color"
        label.font = UIFont(name: "Helvetica", size: 25.0)
        label.textAlignment = .left
        
        return label
    }()
    
    private let backgroundColorChangersStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        return stackView
    }()
    
    var delegate: Delegate?
    
    
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
        configureButtons()
    }
    
    
    // MARK: - Private Methods
    private func setupMainStackView() {
        view.addSubview(colorPaletteMainStackView)
        setupColorPaletteMainStackViewConstraints()
        setupColorPaletteMainStackViewMargins()
    }
    
    private func configureMainStackView() {
        colorPaletteMainStackView.addArrangedSubview(changeButtonColorLabel)
        colorPaletteMainStackView.addArrangedSubview(buttonColorChangersStackView)
        colorPaletteMainStackView.setCustomSpacing(60, after: buttonColorChangersStackView)
        colorPaletteMainStackView.addArrangedSubview(changeBackgroundColorLabel)
        colorPaletteMainStackView.addArrangedSubview(backgroundColorChangersStackView)
    }
    
    private func configureButtons() {
        configureButtons(for: buttonColorChangersStackView, with: possibleButtonColors)
        configureButtons(for: backgroundColorChangersStackView, with: possibleButtonColors)
    }
    
    private func configureButtons(
        for stackView: UIStackView,
        with colors: [UIColor]
    ) {
        possibleButtonColors.forEach { color in
            let button = UIButton()
            button.backgroundColor = color
            button.layer.borderColor = UIColor(named: "black")?.cgColor
            button.layer.borderWidth = 1
            
            button.addAction(UIAction(handler: { [weak self] _ in
                
                if stackView == self?.buttonColorChangersStackView {
                    self?.delegate?.changeButtonColors(color: color)
                } else {
                    self?.delegate?.changeBackgroundColor(color: color)
                }
                
            }), for: .touchUpInside)
            
            button.heightAnchor.constraint(equalToConstant: 50).isActive = true
            stackView.addArrangedSubview(button)
        }
    }
    

    // MARK: - Constraints and Margins
    private func setupColorPaletteMainStackViewConstraints() {
        NSLayoutConstraint.activate([
            colorPaletteMainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            colorPaletteMainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            colorPaletteMainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    private func setupColorPaletteMainStackViewMargins() {
        colorPaletteMainStackView.isLayoutMarginsRelativeArrangement = true
        colorPaletteMainStackView.layoutMargins = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
    
    
}

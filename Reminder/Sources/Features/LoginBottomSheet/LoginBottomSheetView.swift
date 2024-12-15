//
//  LoginBottomSheetView.swift
//  Reminder
//
//  Created by Alysson Barrera on 14/12/24.
//

import UIKit

class LoginBottomSheetView: UIView {
    public weak var delegate: LoginBottomSheetViewDelegate?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "login.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.subHeading
        label.textColor = Colors.gray800
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.loginText.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.label
        label.textColor = Colors.gray800
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let passwordTextFieldLabel: UILabel = {
        let label = UILabel()
        label.text = "login.passwordText.label.title".localized
        label.isUserInteractionEnabled = true
        label.font = Typography.label
        label.textColor = Colors.gray800
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let handleArea: UIView = {
        let view = UIView()
        view.backgroundColor = Colors.gray800
        view.layer.cornerRadius = Metrics.tiny
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.email.placeholder".localized
        text.layer.cornerRadius = 8
        text.borderStyle = .roundedRect
        text.layer.borderWidth = 1
        text.layer.borderColor = Colors.gray400.cgColor
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let passwordTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "login.password.placeholder".localized
        text.layer.cornerRadius = 8
        text.borderStyle = .roundedRect
        text.layer.borderWidth = 1
        text.layer.borderColor = Colors.gray400.cgColor
        text.backgroundColor = .clear
        text.isSecureTextEntry = true
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("login.button.title".localized, for: .normal)
        button.backgroundColor = Colors.primaryRedBase
        button.layer.cornerRadius = Metrics.medium
        button.addTarget(self, action: #selector(loginButtonDidTapeed), for: .touchUpInside)
        button.tintColor = Colors.gray100
        button.titleLabel?.font = Typography.subHeading
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        
        let exampleGest = UITapGestureRecognizer(target: self, action: #selector(exampleTaped))
        titleLabel.addGestureRecognizer(exampleGest)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func exampleTaped() {
        print("clicou na label")
    }
    
    private func setupUI() {
        self.backgroundColor = Colors.gray100
        self.layer.cornerRadius = Metrics.small
        
        addSubview(titleLabel)
        addSubview(loginTextFieldLabel)
        addSubview(emailTextField)
        addSubview(passwordTextFieldLabel)
        addSubview(passwordTextField)
        addSubview(loginButton)
        
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.huge),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            loginTextFieldLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: Metrics.huge),
            loginTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            emailTextField.topAnchor.constraint(equalTo: loginTextFieldLabel.bottomAnchor, constant: Metrics.tiny),
            emailTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            emailTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            emailTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            passwordTextFieldLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Metrics.medium),
            passwordTextFieldLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldLabel.bottomAnchor, constant: Metrics.tiny),
            passwordTextField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            passwordTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            passwordTextField.heightAnchor.constraint(equalToConstant: Metrics.inputSize),
            
            loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.medium),
            loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.medium),
            loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -Metrics.huge),
            loginButton.heightAnchor.constraint(equalToConstant: Metrics.primaryButton)
        ])
    }
    
    @objc
    private func loginButtonDidTapeed() {
        let user = emailTextField.text ?? ""
        let password  = passwordTextField.text ?? ""
        delegate?.sendLoginData(user: user, password: password)
    }
}

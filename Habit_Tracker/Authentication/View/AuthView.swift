//
//  AuthView.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import UIKit

final class AuthView: UIView {

    let emailTxtFld = UITextField()
    let passwordTxtFld = UITextField()
    let loginBtn = UIButton()
    let signUpBtn = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        createSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func createSubViews() {
        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        emailTxtFld.translatesAutoresizingMaskIntoConstraints = false
        emailTxtFld.textAlignment = .left
        emailTxtFld.layer.cornerRadius = 3
        emailTxtFld.layer.borderColor = UIColor.systemPink.cgColor
        emailTxtFld.layer.borderWidth = 1
        emailTxtFld.textColor = .systemPink
        emailTxtFld.font = UIFont.systemFont(ofSize: 24)
        emailTxtFld.placeholder = "Email"
        self.addSubview(emailTxtFld)

        passwordTxtFld.translatesAutoresizingMaskIntoConstraints = false
        passwordTxtFld.textAlignment = .left
        passwordTxtFld.layer.cornerRadius = 3
        passwordTxtFld.layer.borderColor = UIColor.systemPink.cgColor
        passwordTxtFld.layer.borderWidth = 1
        passwordTxtFld.font = UIFont.systemFont(ofSize: 24)
        passwordTxtFld.textColor = .systemPink
        passwordTxtFld.placeholder = "Password"

        self.addSubview(passwordTxtFld)

        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.tintColor = .white
        loginBtn.layer.borderColor = UIColor.lightGray.cgColor
        loginBtn.layer.cornerRadius = 3
        loginBtn.layer.borderWidth = 1
        loginBtn.backgroundColor = .systemPink
        self.addSubview(loginBtn)

        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.setTitle("Sign up", for: .normal)
        signUpBtn.tintColor = .white
        signUpBtn.layer.borderColor = UIColor.lightGray.cgColor
        signUpBtn.layer.cornerRadius = 3
        signUpBtn.layer.borderWidth = 1
        signUpBtn.backgroundColor = .systemPink
        //        signUpBtn.addTarget(self, action: #selector(signUpDidTouch), for: .touchUpInside)
        self.addSubview(signUpBtn)

        NSLayoutConstraint.activate([

            emailTxtFld.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 60.0),
            emailTxtFld.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            emailTxtFld.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),

            passwordTxtFld.topAnchor.constraint(equalTo: emailTxtFld.bottomAnchor, constant: 15),
            passwordTxtFld.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            passwordTxtFld.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 20.0),

            loginBtn.topAnchor.constraint(equalTo: passwordTxtFld.bottomAnchor, constant: 30),
            loginBtn.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -100.0),
            loginBtn.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 100.0),

            signUpBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            signUpBtn.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -100.0),
            signUpBtn.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: 100.0)

        ])
    }
}

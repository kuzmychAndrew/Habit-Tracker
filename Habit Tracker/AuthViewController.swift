//
//  AuthViewController.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 08.08.2022.
//

import UIKit
import FirebaseAuth


class AuthViewController: UIViewController {
    
    var emailTxtFld: UITextField!
    var passwordTxtFld: UITextField!
    var loginBtn: UIButton!
    var signUpBtn: UIButton!
    
    var handle: AuthStateDidChangeListenerHandle?
    let LoginToHabits = "LoginToHabits"

    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handle = Auth.auth().addStateDidChangeListener { _, user in
          // 2
          if user == nil {
            self.navigationController?.popToRootViewController(animated: true)
          } else {
            // 3
            self.performSegue(withIdentifier: self.LoginToHabits, sender: nil)
            self.emailTxtFld.text = nil
            self.passwordTxtFld.text = nil
          }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }
    

    @objc func signUpDidTouch(sender: UIButton){
        guard
          let email = emailTxtFld.text,
          let password = passwordTxtFld.text,
          !email.isEmpty,
          !password.isEmpty
        else {return}
            
        Auth.auth().createUser(withEmail: email, password: password) {_, error in
          
          if error == nil{
            Auth.auth().signIn(withEmail: email, password: password)
          }else{
            print("Error in createUser: \(error?.localizedDescription ?? "")")
          }
        }

    }
    
    @objc func loginDidTouch(sender: UIButton){
        guard
          let email = emailTxtFld.text,
          let password = passwordTxtFld.text,
          !email.isEmpty,
          !password.isEmpty
        else { return }

        Auth.auth().signIn(withEmail: email, password: password) { user, error in
          if let error = error, user == nil {
            let alert = UIAlertController(
              title: "Sign In Failed",
              message: error.localizedDescription,
              preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
          }
        }
    }
    
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        emailTxtFld = UITextField()
        emailTxtFld.translatesAutoresizingMaskIntoConstraints = false
        emailTxtFld.textAlignment = .left
        emailTxtFld.layer.cornerRadius = 3
        emailTxtFld.layer.borderColor = UIColor.lightGray .cgColor
        emailTxtFld.layer.borderWidth = 1
        //emailTxtFld.backgroundColor = .blue
        emailTxtFld.font = UIFont.systemFont(ofSize: 24)
        emailTxtFld.placeholder = "Email"
        view.addSubview(emailTxtFld)
        
        passwordTxtFld = UITextField()
        passwordTxtFld.translatesAutoresizingMaskIntoConstraints = false
        passwordTxtFld.textAlignment = .left
        passwordTxtFld.layer.cornerRadius = 3
        passwordTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        passwordTxtFld.layer.borderWidth = 1
        //emailTxtFld.backgroundColor = .blue
        passwordTxtFld.font = UIFont.systemFont(ofSize: 24)
        passwordTxtFld.placeholder = "Password"
        view.addSubview(passwordTxtFld)
        
        loginBtn = UIButton()
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.layer.borderColor = UIColor.lightGray.cgColor
        loginBtn.layer.cornerRadius = 3
        loginBtn.layer.borderWidth = 1
        loginBtn.backgroundColor = .black
        view.addSubview(loginBtn)
        
        signUpBtn = UIButton()
        signUpBtn.translatesAutoresizingMaskIntoConstraints = false
        signUpBtn.setTitle("Sign up", for: .normal)
        signUpBtn.layer.borderColor = UIColor.lightGray.cgColor
        signUpBtn.layer.cornerRadius = 3
        signUpBtn.layer.borderWidth = 1
        signUpBtn.backgroundColor = .black
        signUpBtn.addTarget(self, action: #selector(signUpDidTouch), for: .touchUpInside)
        view.addSubview(signUpBtn)
        

        
        
        NSLayoutConstraint.activate([
        
            emailTxtFld.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 60.0),
            emailTxtFld.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            emailTxtFld.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            
            passwordTxtFld.topAnchor.constraint(equalTo: emailTxtFld.bottomAnchor, constant: 15),
            passwordTxtFld.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20.0),
            passwordTxtFld.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20.0),
            
            loginBtn.topAnchor.constraint(equalTo: passwordTxtFld.bottomAnchor, constant: 30),
            loginBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100.0),
            loginBtn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100.0),
            
            signUpBtn.topAnchor.constraint(equalTo: loginBtn.bottomAnchor, constant: 30),
            signUpBtn.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -100.0),
            signUpBtn.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 100.0)
            
        ])
        
        
    }

}

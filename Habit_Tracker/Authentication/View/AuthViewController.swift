//
//  AuthViewController.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 08.08.2022.
//

import UIKit
import FirebaseAuth

class AuthViewController: UIViewController {
    // swiftlint:disable force_cast
    var authView: AuthView {return view as! AuthView}
    // swiftlint:enable force_cast
    var handle: AuthStateDidChangeListenerHandle?
    let viewModel = ViewModelBuilder.createAuthVM()
    let loginToHabits = "LoginToHabits"
    let authService = AuthServices()
    override func loadView() {
        super.loadView()
        self.view = AuthView(frame: UIScreen.main.bounds)
        authView.loginBtn.addTarget(self, action: #selector(loginDidTouch(sender: )), for: .touchUpInside)
        authView.signUpBtn.addTarget(self, action: #selector(signUpDidTouch), for: .touchUpInside)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.checkAuthVM { (checkVM) in
            if checkVM == false {
                self.navigationController?.popToRootViewController(animated: true)
            } else {
                self.performSegue(withIdentifier: self.loginToHabits, sender: nil)
                self.authView.emailTxtFld.text = nil
                self.authView.passwordTxtFld.text = nil
            }
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        viewModel.removeStateVM()
    }
    @objc func signUpDidTouch(sender: UIButton) {
        viewModel.signUpVM(email: authView.emailTxtFld.text, password: authView.passwordTxtFld.text)
    }
    @objc func loginDidTouch(sender: UIButton) {
        viewModel.loginVM(email: authView.emailTxtFld.text, password: authView.passwordTxtFld.text) { errorVM, userVM in
            if let error = errorVM, userVM == nil {
                let alert = UIAlertController(
                    title: "Sign In Failed",
                    message: error.localizedDescription,
                    preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
}

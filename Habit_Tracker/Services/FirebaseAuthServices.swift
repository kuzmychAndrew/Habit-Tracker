//
//  FirebaseAuthServices.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import Foundation
import FirebaseAuth
protocol AuthServicesProtocol {
    func checkAuth(completion: @escaping(Bool) -> Void)
    func removeState()

    func signUp(email: String?, password: String?)

    func login(email: String?, password: String?, comletion: @escaping((any Error)?, AuthDataResult?) -> Void)

    func getCurrentUser(completion: @escaping(String) -> Void)
}

class AuthServices: AuthServicesProtocol {

    var user: User?
    var handle: AuthStateDidChangeListenerHandle?

    func checkAuth(completion: @escaping(Bool) -> Void) {
        var check = false

        handle = Auth.auth().addStateDidChangeListener { _, user in

            if user == nil {
                check = false
                completion(check)
            } else {
                check = true
                completion(check)
            }
        }
    }
    func removeState() {
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)

    }

    func signUp(email: String?, password: String?) {
        guard
            let email = email,
            let password = password,
            !email.isEmpty,
            !password.isEmpty
        else {return}

        Auth.auth().createUser(withEmail: email, password: password) {_, error in

            if error == nil {
                Auth.auth().signIn(withEmail: email, password: password)
            } else {
                print("Error in createUser: \(error?.localizedDescription ?? "")")
            }
        }
    }

    func login(email: String?, password: String?, comletion: @escaping((any Error)?, AuthDataResult?) -> Void) {
        guard
            let email = email,
            let password = password,
            !email.isEmpty,
            !password.isEmpty
        else { return }

        Auth.auth().signIn(withEmail: email, password: password) { user, error in
            comletion(error, user)
        }

    }

    func getCurrentUser(completion: @escaping (String) -> Void) {
        handle = Auth.auth().addStateDidChangeListener { _, user in
            guard let user = user  else { return }
            let currentUser = User(authData: user)
            let userEmail = currentUser.email
            completion(userEmail)
        }

    }
}

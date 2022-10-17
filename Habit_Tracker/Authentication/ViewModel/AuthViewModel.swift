//
//  AuthViewModel.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import Foundation
import FirebaseAuth

final class AuthViewModel {

    private var authService: AuthServicesProtocol

    init(authService: AuthServicesProtocol) {
        self.authService = authService
    }

    func checkAuthVM(completion: @escaping (Bool) -> Void) {
        authService.checkAuth { (check) in
            let checkVM = check
            print(checkVM)
            completion(check)

        }
    }

    func removeStateVM() {
        authService.removeState()
    }

    func signUpVM(email: String?, password: String?) {
        authService.signUp(email: email, password: password)
    }

    func loginVM(email: String?, password: String?, comletion: @escaping ((Error)?, AuthDataResult?) -> Void) {
        authService.login(email: email, password: password) { error, user in
            let errorVM = error
            let userVm = user
            comletion(errorVM, userVm)

        }
    }
}

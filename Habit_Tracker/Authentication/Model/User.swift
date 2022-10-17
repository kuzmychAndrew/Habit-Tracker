//
//  User.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 03.08.2022.
//

import Firebase
import FirebaseAuth

struct User {
    let uid: String
    let email: String

    init(authData: FirebaseAuth.User) {
        uid = authData.uid
        email = authData.email ?? ""
    }

    init(uid: String, email: String) {
        self.uid = uid
        self.email = email
    }
}

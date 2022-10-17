//
//  File.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 03.08.2022.
//
protocol DatabaseServiceProtocol {
    func saveHabit(habit: String, progress: Float, isDone: Bool, addedByUser: String)

    func readHabit(completion: @escaping([FirebaseModel]) -> Void)

    func deleteObs()

    func deleteHabitsItem(item: FirebaseModel)

}

import Foundation
import Firebase
import FirebaseAuth
class DatabaseServices: DatabaseServiceProtocol {

    var databaseName = ""
    let ref = Database.database().reference(withPath: "users")
    var refObserver: [DatabaseHandle] = []
    var habits: [FirebaseModel] = []
    var handle: AuthStateDidChangeListenerHandle?

    func saveHabit(habit: String, progress: Float, isDone: Bool, addedByUser: String) {
        let date = Date()
        let dataFormater = DateFormatter()
        dataFormater.dateFormat = "dd/MM/yyyy"
        let currentDate = dataFormater.string(from: date)
        handle = Auth.auth().addStateDidChangeListener { [self] _, user in
            guard let user = user  else { return }
            let currentUser = User(authData: user)
            let email = currentUser.email
            let emailCodded = email.replacingOccurrences(of: ".", with: ",")
            let userRef = self.ref.child(String(emailCodded))
            databaseName = addedByUser.lowercased()
            let habitItem = FirebaseModel(habit: habit, progres: progress, date: currentDate, isDone: isDone, addedByUser: addedByUser)
            let habitItemRef = userRef.child(habit.lowercased())
            habitItemRef.setValue(habitItem.toAnyObject())
            print(habit)
        }

    }

    func readHabit(completion: @escaping([FirebaseModel]) -> Void) {
        handle = Auth.auth().addStateDidChangeListener { [self] _, user in
            guard let user = user  else { return }
            let currentUser = User(authData: user)
            let email = currentUser.email
            let emailCodded = email.replacingOccurrences(of: ".", with: ",")
            let userRef = self.ref.child(String(emailCodded))
            let completed = userRef.observe(.value) { snapshot in

                var newHabits: [FirebaseModel] = []

                for child in snapshot.children {
                    if
                        let snapshot = child as? DataSnapshot,
                        let habits = FirebaseModel(snapshot: snapshot) {
                        newHabits.append(habits)
                    }
                }
                completion(newHabits)
            }
            self.refObserver.append(completed)
        }

    }

    func deleteObs() {
        self.refObserver.forEach(ref.removeObserver(withHandle:))
        self.refObserver = []
    }

    func deleteHabitsItem(item: FirebaseModel) {

        item.ref?.removeValue()

    }

}

//
//  FirebaseModel.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 03.08.2022.
//

import Foundation
import Firebase
struct FirebaseModel: Identifiable {
    var id = UUID()
    let ref: DatabaseReference?
    let key: String
    let habit: String
    let addedByUser: String
    let progres: Float
    let date: String
    let isDone: Bool

    init(habit: String, progres: Float, key: String = "", date: String, isDone: Bool, addedByUser: String) {
        self.ref = nil
        self.key = key
        self.habit = habit
        self.addedByUser = addedByUser
        self.progres = progres
        self.date = date
        self.isDone = isDone
    }
    init?(snapshot: DataSnapshot) {
        guard
            let value = snapshot.value as? [String: AnyObject],
            let habit = value["habit"] as? String,
            let addedByUser = value["addedByUser"] as? String,
            let progres = value["progres"] as? Float,
            let date = value["date"] as? String,
            let isDone = value["isDone"] as? Bool
        else {
            return nil
        }
        self.ref = snapshot.ref
        self.key = snapshot.key
        self.habit = habit
        self.addedByUser = addedByUser
        self.progres = progres
        self.date = date
        self.isDone = isDone
    }

    // MARK: Convert GroceryItem to AnyObject
    func toAnyObject() -> Any {
        return [
            "habit": habit,
            "addedByUser": addedByUser,
            "progres": progres,
            "date": date,
            "isDone": isDone
        ]
    }
}

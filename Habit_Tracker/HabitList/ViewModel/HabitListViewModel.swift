//
//  HabitListViewModel.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import Foundation

class HabitListViewModel {
    private var databaseService: DatabaseServiceProtocol
    private var authService: AuthServicesProtocol

    init(databaseService: DatabaseServiceProtocol, authService: AuthServicesProtocol) {
        self.databaseService = databaseService
        self.authService = authService
    }

    func saveHabitVM(habit: String, progress: Float, isDone: Bool, addedByUser: String) {
        databaseService.saveHabit(habit: habit, progress: progress, isDone: isDone, addedByUser: addedByUser)
    }

    func readHabitVM(completion: @escaping([FirebaseModel]) -> Void) {
        var habitsVM: [FirebaseModel] = []
        databaseService.readHabit { (newHabits) in
            habitsVM = newHabits
            print("habitsVM = \(habitsVM)")
            completion(habitsVM)
        }
    }

    func deleteObsVM() {
        databaseService.deleteObs()
    }

    func deleteHabitsItemVM(itemVM: FirebaseModel) {
        databaseService.deleteHabitsItem(item: itemVM)
    }

    func getCurrentUserVM(completion: @escaping (String) -> Void) {
        authService.getCurrentUser { (userEmail) in
            let userEmailVM = userEmail
            completion(userEmailVM)

        }
    }
}

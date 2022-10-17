//
//  AddViewModel.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import Foundation

final class AddViewModel {

    private var databaseService: DatabaseServiceProtocol
    private var authService: AuthServicesProtocol

    init(databaseService: DatabaseServiceProtocol, authService: AuthServicesProtocol ) {
        self.databaseService = databaseService
        self.authService = authService
    }

    func saveHabitVM(habit: String, progress: Float, isDone: Bool, addedByUser: String) {
        databaseService.saveHabit(habit: habit, progress: progress, isDone: isDone, addedByUser: addedByUser)

    }

    func getCurrentUserVM(completion: @escaping (String) -> Void) {
        authService.getCurrentUser { (userEmail) in
            let userEmailVM = userEmail
            completion(userEmailVM)

        }

    }

    func removeStateVM() {
        authService.removeState()
    }
}

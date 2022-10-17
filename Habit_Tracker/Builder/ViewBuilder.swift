//
//  ViewVuilder.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import Foundation
final class ViewModelBuilder {
    static func createHbtLstVM() -> HabitListViewModel {
        let databaseService = DatabaseServices()
        let authService = AuthServices()
        let hbtLstViewModel = HabitListViewModel(databaseService: databaseService, authService: authService)
        return hbtLstViewModel
    }

    static func createAuthVM() -> AuthViewModel {
        let authService = AuthServices()
        let authViewModel = AuthViewModel(authService: authService)
        return authViewModel

    }
    static func createAddVM() -> AddViewModel {
        let databaseService = DatabaseServices()
        let authService = AuthServices()
        let addViewModel = AddViewModel(databaseService: databaseService, authService: authService)
        return addViewModel
    }
}

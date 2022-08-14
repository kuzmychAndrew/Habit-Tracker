////
////  RealmServices.swift
////  Habit Tracker
////
////  Created by Андрій Кузьмич on 27.04.2022.
////
//
//import Foundation
//import RealmSwift
//
//final class RealmService{
//    var realm: Realm {
//        get {
//            do {
//                let realm = try Realm()
//                return realm
//                } catch {
//                    print("Could not access database: ", error)
//                }
//                return self.realm
//            }
//        }
//    
//    func readingHabits(competion: @escaping([String]) -> Void){
//        do {
//            var habits = try! Realm().objects((RealmModel.self))
//            var habitsMassive = [String]()
//            for i in habits{
//                //habitsMassive.append(i ?? )
//                
//            }
//            //competion(habits)
//            print(habits)
//        } catch{
//            print(error)
//        }
//        
//    }
//    
//    func writingHabits(habit: String){
//        let newHabit = RealmModel(habit: habit)
//        
//        do{
//            try realm.write{
//                realm.add(newHabit)
//            }
//            let path = realm.configuration.fileURL?.path
//            print("Path: \(String(describing: path))")
//        } catch{
//            print("Error")
//        }
//        
//    }
//    
//}

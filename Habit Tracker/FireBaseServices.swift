//
//  File.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 03.08.2022.
//

import Foundation
import Firebase
class FirebaseServices{
    let ref = Database.database().reference(withPath: "habits")
    var refObserver: [DatabaseHandle] = []
    var habits: [FirebaseModel] = []
    
    func saveHabit(habit: String){
        let habitItem = FirebaseModel(habit: habit, progres: false)
        
        let habitItemRef = self.ref.child(habit.lowercased())
        habitItemRef.setValue(habitItem.toAnyObject())
        print(habit)
    }
    
    func readHabit(completion: @escaping([FirebaseModel])->()){
//        ref.observe(.value, with: { snapshot in
//          print(snapshot.value as Any)
//        })
        
        let completed = ref.observe(.value){ snapshot in
            
            var newHabits:[FirebaseModel] = []
            
            for child in snapshot.children {
            
            // 4
            if
              let snapshot = child as? DataSnapshot,
              let habits = FirebaseModel(snapshot: snapshot) {
              newHabits.append(habits)
            }
          }
//            self.habits += newHabits
//            print(self.habits)
            completion(newHabits)

        }
        
        self.refObserver.append(completed)
        //print(habits)
    }
    
   
}

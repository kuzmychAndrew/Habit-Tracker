//
//  ViewController.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 16.04.2022.
//

import UIKit
import SwiftUI
import Firebase

class ViewController: UIViewController {
    
    var tableView = UITableView()

    let ref = Database.database().reference(withPath: "habits")
    var habits:[FirebaseModel] = []
    //var color = [UIColor.blue, UIColor.yellow]
    var refObservers: [DatabaseHandle] = []
    var firebaseService = FirebaseServices()
    //@IBOutlet weak var habitTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadView()
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(HabitTableViewCell.self, forCellReuseIdentifier:HabitTableViewCell.identifier)

        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
//        firebaseService.readHabit()

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        //print(read)
//        ref.observe(.value, with: {snapshot in
//            print(snapshot.value as Any)
//        })

//        let completed = ref.observe(.value) { snapshot in
//          // 2
//          var newHabit: [FirebaseModel] = []
//          // 3
//          for child in snapshot.children {
//            // 4
//            if
//              let snapshot = child as? DataSnapshot,
//              let habits = FirebaseModel(snapshot: snapshot) {
//              newHabit.append(habits)
////            print (habits)
//            }
//          }
//
        firebaseService.readHabit{ (newHabits) in
            print(newHabits)
            self.habits = newHabits
            self.tableView.reloadData()
        }
//        print(newHabit)
//        self.habits = newHabit
            
            //print(newHabit)
        
        
        //}
        // 6
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        refObservers.forEach(ref.removeObserver(withHandle:))
        refObservers = []
    }
    
    override func loadView(){
        super.loadView()
        view = UIView()
        view.backgroundColor = .white
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        NSLayoutConstraint.activate([
        self.view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
        self.view.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
        self.view.trailingAnchor.constraint(equalTo: tableView.trailingAnchor),
                ])
        self.tableView = tableView

        
//        table = UITableView()
//        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
//        //table.frame = CGRect(x: 10, y: 10, width: 100, height: 500)
//        table.dataSource = self
//        table.delegate = self
//        table.frame = view.bounds
//        view.addSubview(table)
//
//        NSLayoutConstraint.activate([
//
//            table.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 10),
//            table.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -10.0),
//            table.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 10.0)
//
//        ])
//
    }
    



}
extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.identifier, for: indexPath) as? HabitTableViewCell else{
            return UITableViewCell()
        }
        let habit = habits[indexPath.row]
        cell.configure(text: habit.habit)
        //let cellColor = color[indexPath.row]
        //cell.habitView.backgroundColor = cellColor
        
        //cell.habitView.layer.cornerRadius = 15.0
        
        return cell
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let habitItem = habits[indexPath.row]
        habitItem.ref?.removeValue()
      }
    }
    
}

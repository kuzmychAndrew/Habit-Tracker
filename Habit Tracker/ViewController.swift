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
    var habits:[FirebaseModel] = []
    var refObservers: [DatabaseHandle] = []
    var firebaseService = FirebaseServices()
    
 
    let ref = Database.database().reference(withPath: "habits")
    let hourToUpdate = Calendar.current.component(.hour, from: Date())
    let date = Date()
    let dateFormatter = DateFormatter()
    
    
    //var progress = Progress(totalUnitCount: 21)
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        print(hourToUpdate)
        if hourToUpdate == 11{
            print("its 11")
        }
        loadView()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.register(UINib.init(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "NewCellIdentifier")
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.global(qos: .background).async{
            self.firebaseService.readHabit{ (newHabits) in
                print(newHabits)
                self.habits = newHabits
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            }
        }
        
       
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

        
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewCellIdentifier", for: indexPath) as! NewTableViewCell
        let habit = habits[indexPath.row]
        let currentDate = dateFormatter.string(from: date)
        
        if currentDate == habit.date{
            cell.checkMarkBtn.isSelected = habit.isDone
        }else{
            cell.checkMarkBtn.isSelected = false
        }
        
        cell.progress.setProgress(Float(habit.progres), animated: false)
        cell.nameOfHabitLBL.text = habit.habit
        cell.selectionStyle = .none
        
        //cell.checkMarkBtn.addTarget(self, action: #selector(checkMarkClicked(sender: )), for: .touchUpInside)
        
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cell = tableView.cellForRow(at: indexPath) as! NewTableViewCell
        let habit = habits[indexPath.row]
        
        var newProgress = habit.progres + 0.04761905
        
        if  habit.isDone != true && newProgress <= 1.0 {
            DispatchQueue.global(qos: .background).async {
                self.firebaseService.saveHabit(habit: habit.habit, progress: newProgress, isDone: true)
            }
            cell.checkMarkBtn.isSelected = true
            
        }else if newProgress >= 1.0{
            let alert = UIAlertController(title: "Congratulation!!!! ", message: "Нou have acquired this habit", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
            habit.ref?.removeValue()
        }
        
        tableView.reloadData()
        
    }
//    @objc func checkMarkClicked(sender: UIButton){
//        print("Button pressed")
//        if sender.isSelected{
//            sender.isSelected = false
//        }else{
//            sender.isSelected = true
//            firebaseService.saveHabit(habit: habit!.habit, progress: habit!.progres + 1)
//        }
    //tableView.reloadData()
    //}
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
      if editingStyle == .delete {
        let habitItem = habits[indexPath.row]
        habitItem.ref?.removeValue()
      }
    }
    
    
    
    
}

//
//  HabitListExtention.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import UIKit

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 71
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return habits.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // swiftlint:disable force_cast
        let cell = tableView.dequeueReusableCell(withIdentifier: HabitTableViewCell.identifier,
                                                 for: indexPath) as! HabitTableViewCell
        // swiftlint:enable force_cast
        let habit = habits[indexPath.row]
        let currentDate = dateFormatter.string(from: date)
        if currentDate == habit.date {
            cell.checkBox.isSelected = habit.isDone
        } else {
            cell.checkBox.isSelected = false
        }
        cell.progressHabit.setProgress(Float(habit.progres), animated: true)
        cell.nameOfHabit.text = habit.habit
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print("tapped")
        // swiftlint:disable force_cast
        let cell = tableView.cellForRow(at: indexPath) as! HabitTableViewCell
        // swiftlint:enable force_cast
        let habit = habits[indexPath.row]
        let newProgress = habit.progres + 0.04761905
        if  cell.checkBox.isSelected == false && newProgress <= 1.0 {
            print("tapped1")
            DispatchQueue.global(qos: .background).async {
                self.viewModel.saveHabitVM(habit: habit.habit,
                                           progress: newProgress,
                                           isDone: true,
                                           addedByUser: habit.addedByUser)
            }
            cell.checkBox.isSelected = true
        } else if newProgress >= 1.0 {
            let alert = UIAlertController(title: "Congratulation!!!! ",
                                          message: "Нou have acquired this habit",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK",
                                          style: .cancel,
                                          handler: nil))
            self.present(alert, animated: true)
            self.viewModel.deleteHabitsItemVM(itemVM: habit)
        }
        tableView.reloadData()
    }
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let habit = habits[indexPath.row]
            self.viewModel.deleteHabitsItemVM(itemVM: habit)
        }
    }
}

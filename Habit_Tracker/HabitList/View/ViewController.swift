//
//  ViewController.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 16.04.2022.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    // swiftlint:disable force_cast
    private var habitListView: HabitListView {return view as! HabitListView}
    // swiftlint:enable force_cast
    var viewModel = ViewModelBuilder.createHbtLstVM()
    var habits: [FirebaseModel] = []
    let date = Date()
    let dateFormatter = DateFormatter()
    override func loadView() {
        super.loadView()
        self.view = HabitListView(frame: UIScreen.main.bounds)
        dateFormatter.dateFormat = "dd/MM/yyyy"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(moveToAdd))
        addButton.tintColor = .systemPink
        self.navigationItem.rightBarButtonItem = addButton
        habitListView.tableView.register(HabitTableViewCell.self, forCellReuseIdentifier: HabitTableViewCell.identifier)
        habitListView.tableView.delegate = self
        habitListView.tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        DispatchQueue.global(qos: .background).async {
            self.viewModel.readHabitVM { (habitsVM) in
                self.habits = habitsVM
                print("view = \(self.habits)")
                DispatchQueue.main.async {
                    self.habitListView.tableView.reloadData()
                }
            }
        }
    }
    @objc func moveToAdd(_ sender: UIBarButtonItem) {
        let storyboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let viewcontr = storyboard.instantiateViewController( withIdentifier: "AddContoller" )
        viewcontr.modalPresentationStyle = .popover
        let popover: UIPopoverPresentationController = viewcontr.popoverPresentationController!
        popover.barButtonItem = sender
        present(viewcontr, animated: true, completion: nil)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        viewModel.deleteObsVM()
    }
}

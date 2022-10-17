//
//  AddHAbitViewController.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 22.04.2022.
//

import UIKit
import Firebase
import FirebaseAuth

class AddHabitViewController: UIViewController {
    // swiftlint:disable force_cast
    var addView: AddView {return view as! AddView}
    // swiftlint:enable force_cast
    var viewModel = ViewModelBuilder.createAddVM()
    var user = ""

    override func loadView() {
        super.loadView()
        self.view = AddView(frame: UIScreen.main.bounds)
        addView.saveBTN.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
    }

    @objc func addHabit(sender: UIButton) {
        guard
            let text = addView.habitTxt.text
        else {return}
        viewModel.saveHabitVM(habit: text, progress: 0.0, isDone: false, addedByUser: user)
        performSegue(withIdentifier: "showMain", sender: nil)
        self.addView.habitTxt.text = ""
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        viewModel.getCurrentUserVM { (userEmailVM) in
            self.user = userEmailVM
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        viewModel.removeStateVM()
    }
}

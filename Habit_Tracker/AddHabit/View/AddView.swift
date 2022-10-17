//
//  AddView.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 15.09.2022.
//

import UIKit

final class AddView: UIView {

    let nameOfHabit = UILabel()
    let habitTxt = UITextField()
    let saveBTN = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        createSubViews()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createSubViews() {

        let view = UIView(frame: .zero)
        view.backgroundColor = .white

        nameOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfHabit.textAlignment = .center
        nameOfHabit.backgroundColor = .white
        nameOfHabit.layer.cornerRadius = 3
        nameOfHabit.text = "Habit title"
        nameOfHabit.numberOfLines = 0
        nameOfHabit.font = UIFont.systemFont(ofSize: 24)
        nameOfHabit.textColor = .systemPink
        self.addSubview(nameOfHabit)

        habitTxt.translatesAutoresizingMaskIntoConstraints = false
        habitTxt.textAlignment = .center
        habitTxt.layer.cornerRadius = 5
        habitTxt.backgroundColor = .systemPink
        habitTxt.textColor = .white
        habitTxt.font = UIFont.systemFont(ofSize: 24)
        habitTxt.placeholder = "Enter new habit"
        self.addSubview(habitTxt)

        saveBTN.translatesAutoresizingMaskIntoConstraints = false
        saveBTN.setTitle("Save", for: .normal)
        saveBTN.layer.cornerRadius = 5
        saveBTN.backgroundColor = UIColor.systemPink
        //        saveBTN.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
        self.addSubview(saveBTN)

        NSLayoutConstraint.activate([

            nameOfHabit.topAnchor.constraint(equalTo: self.layoutMarginsGuide.topAnchor, constant: 150),
            nameOfHabit.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
            nameOfHabit.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +20),

            habitTxt.topAnchor.constraint(equalTo: nameOfHabit.bottomAnchor, constant: 20),
            habitTxt.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
            habitTxt.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +20),

            saveBTN.topAnchor.constraint(equalTo: habitTxt.bottomAnchor, constant: 20),
            saveBTN.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: -20),
            saveBTN.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: +20)

        ])
    }
}

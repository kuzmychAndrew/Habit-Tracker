//
//  HabitTableViewCell.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 16.04.2022.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    var nameOfHabit = UILabel()
    var checkBox = UIButton()
    var progressHabit = UIProgressView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        configureView()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configureView() {
        contentView.backgroundColor = .systemPink
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor

        nameOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfHabit.textColor = .white
        nameOfHabit.textAlignment = .left
        contentView.addSubview(nameOfHabit)

        checkBox.translatesAutoresizingMaskIntoConstraints = false
        // checkBox.image(for: .selected) = UIImage(systemName: "checkmark")
        checkBox.setImage(UIImage(systemName: "checkmark"), for: .selected)
        checkBox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkBox.tintColor = UIColor.white

        contentView.addSubview(checkBox)

        progressHabit.translatesAutoresizingMaskIntoConstraints = false
        progressHabit.progressTintColor = UIColor.gray
        progressHabit.trackTintColor = .white

        contentView.addSubview(progressHabit)

        NSLayoutConstraint.activate([
            progressHabit.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10.0),
            progressHabit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            progressHabit.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            progressHabit.widthAnchor.constraint(equalToConstant: contentView.frame.width - 20.0),
            progressHabit.heightAnchor.constraint(equalToConstant: 6.0),

            nameOfHabit.topAnchor.constraint(equalTo: progressHabit.bottomAnchor, constant: 10.0),
            nameOfHabit.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10.0),
            nameOfHabit.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),

            checkBox.topAnchor.constraint(equalTo: progressHabit.bottomAnchor, constant: 10.0),
            checkBox.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10.0),
            checkBox.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10.0),
            checkBox.widthAnchor.constraint(equalToConstant: 50.0),
            checkBox.heightAnchor.constraint(equalToConstant: 50.0)

        ])
    }
}

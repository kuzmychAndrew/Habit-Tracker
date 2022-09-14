//
//  HabitTableViewCell.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 16.04.2022.
//

import UIKit

class HabitTableViewCell: UITableViewCell {
    static let identifier = "CustomTableViewCell"
    
    private let nameOfHabit: UILabel = {
        let nameOfhabit = UILabel()
        nameOfhabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfhabit.textColor = .white
        nameOfhabit.textAlignment = .left
        
        return nameOfhabit
    }()
    private let checkBox: UIButton = {
        let checkBox = UIButton()
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        
        return checkBox
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = .lightGray
        contentView.backgroundColor = .systemPink
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.addSubview(nameOfHabit)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameOfHabit.frame = CGRect(x: 10.0, y: 5.0, width: contentView.frame.width-100, height: 60)
    }
    
    public func configure(text: String){
        nameOfHabit.text = text
    }
}

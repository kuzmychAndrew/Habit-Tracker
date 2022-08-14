//
//  HabitTableViewCell.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 16.04.2022.
//

import UIKit

class HabitTableViewCell: UITableViewCell {

    @IBOutlet weak var habitView: UIView!
    @IBOutlet weak var nameOfHabitLbl: UILabel!
    @IBOutlet weak var countOfHabitLbl: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

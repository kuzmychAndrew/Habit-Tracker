//
//  NewTableViewCell.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 13.09.2022.
//

import UIKit

class NewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameOfHabitLBL: UILabel!
    @IBOutlet weak var checkMarkBtn: UIButton!
    @IBOutlet weak var progress: UIProgressView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func layoutSubviews() {
        super.layoutSubviews()

        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10))
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
    }
    
}

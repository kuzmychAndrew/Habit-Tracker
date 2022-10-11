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
//     let nameOfHabit: UILabel = {
//        let nameOfhabit = UILabel()
//        nameOfhabit.translatesAutoresizingMaskIntoConstraints = false
//        nameOfhabit.textColor = .white
//        nameOfhabit.textAlignment = .left
//
//        return nameOfhabit
//    }()
//     let checkBox: UIButton = {
//        let checkBox = UIButton()
//        checkBox.translatesAutoresizingMaskIntoConstraints = false
//
//        return checkBox
//    }()
//    let progress: UIProgressView = {
//        let progress = UIProgressView()
//        progress.translatesAutoresizingMaskIntoConstraints = false
//        return progress
//    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //contentView.backgroundColor = .lightGray
        configureView()
        
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(){
        contentView.backgroundColor = .systemPink
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 20.0
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        
        nameOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfHabit.textColor = .white
        nameOfHabit.textAlignment = .left
        contentView.addSubview(nameOfHabit)
        
        checkBox.translatesAutoresizingMaskIntoConstraints = false
        //checkBox.image(for: .selected) = UIImage(systemName: "checkmark")
        checkBox.setImage(UIImage(systemName: "checkmark"), for: .selected)
        checkBox.setImage(UIImage(systemName: "circle"), for: .normal)
        checkBox.tintColor = UIColor.white
        
        contentView.addSubview(checkBox)
        
        progressHabit.translatesAutoresizingMaskIntoConstraints = false
        progressHabit.progressTintColor = UIColor.purple
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

//    override func layoutSubviews() {
//        super.layoutSubviews()
//        nameOfHabit.frame = CGRect(x: 10.0, y: 20.0, width: contentView.frame.width-100, height: 60)
//        checkBox.frame = CGRect(x: 100.0, y: 20.0, width: 10, height: 10)
//    }

//    public func configure(text: String){
//        nameOfHabit.text = text
//    }
}
//
//  NewTableViewCell.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 13.09.2022.
//

//import UIKit
//
//class NewTableViewCell: UITableViewCell {
//    static let identifier = "NewTableViewCell"
//    static func nib() -> UINib{
//        return UINib(nibName: "NewTableViewCell", bundle: nil)
//    }
//
//    @IBOutlet weak var nameOfHabitLBL: UILabel!
//    @IBOutlet weak var checkMarkBtn: UIButton!
//    @IBOutlet weak var progressOfHabit: UIProgressView!
//
////    public func configure(name: String, isDone: Bool, progress: Float){
////        nameOfHabitLBL.text = name
////        checkMarkBtn.isSelected = isDone
////        progressView.setProgress(progress, animated: true)
////
////    }
//
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//
//        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 1, left: 10, bottom: 1, right: 10))
//        contentView.layer.borderWidth = 1.0
//        contentView.layer.cornerRadius = 20.0
//        contentView.backgroundColor = UIColor.systemPink
//        contentView.layer.borderColor = UIColor.lightGray.cgColor
//
//    }
//
//}
//

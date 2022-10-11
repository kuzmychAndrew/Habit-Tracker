//
//  HabitListView.swift
//  Habit Tracker
//
//  Created by Андрій Кузьмич on 11.10.2022.
//

import UIKit

final class HabitListView: UIView{
    
    var tableView: UITableView!
    override init(frame: CGRect) {
           super.init(frame: frame)
           self.backgroundColor = .white
           createSubViews()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createSubViews(){
        let view = UIView(frame: .zero)
        view.backgroundColor = .black
        
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(tableView)
        
        
        NSLayoutConstraint.activate([
            self.safeAreaLayoutGuide.topAnchor.constraint(equalTo: tableView.topAnchor),
            self.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: tableView.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: tableView.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: tableView.trailingAnchor)
        ])
        self.tableView = tableView
        
        
        
        
    }
}

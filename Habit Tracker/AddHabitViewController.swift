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

    
    var nameOfHabit:UILabel!
    var habitTxt: UITextField!
    var saveBTN: UIButton!
    var firebaseServices = FirebaseServices()
    //@IBOutlet weak var addView: UIView!
//    @IBOutlet weak var nameHabitLbl: UILabel!
//    @IBOutlet weak var habitTxtFld: UITextField!
//    //@IBOutlet weak var saveBtn: UIBarButtonItem!
//    //@IBOutlet weak var CancelBtn: UIBarButtonItem!
//    @IBOutlet weak var savaBtn: UIButton!
    
//    var realm = RealmService()
    let ref = Database.database().reference(withPath: "habits")
    let usersRef = Database.database().reference(withPath: "online")
    
    var habits: [FirebaseModel] = []
    var user: User?
    var onlineUserCount = UIBarButtonItem()
    var refObservers: [DatabaseHandle] = []
    //var handle: AuthStateDidChangeListenerHandle!
    var usersRefObservers: [DatabaseHandle] = []
    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    
    @objc func addHabit(sender: UIButton) {
        print("hello")
        guard
            let text = habitTxt.text
            //let user = self.user
        else{return}
        print("hello2")
        firebaseServices.saveHabit(habit: text)
//        let habitItem = FirebaseModel(habit: text, progres: false)
//
//        let habitItemRef = self.ref.child(text.lowercased())
//        habitItemRef.setValue(habitItem.toAnyObject())
//        print(text)
        self.habitTxt.text = ""
//        self.habits.append(habitItem)
        
        
//        var newHabbit = String(self.habitTxtFld.text!)
//        realm.writingHabits(habit: newHabbit)
//        print(newHabbit)
        
    }
   
//    @IBAction func addHabit(_ sender: UIButton){
//
//    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewDidLoad() {
        super.viewDidLoad()

//        savaBtn.addTarget(self, action: #selector(addHabit(_:)), for: .touchUpInside)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        handle = Auth.auth().addStateDidChangeListener { _, user in
          guard let user = user else { return }
          self.user = User(authData: user)
        }
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        guard let handle = handle else { return }
        Auth.auth().removeStateDidChangeListener(handle)
    }

    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        nameOfHabit = UILabel()
        nameOfHabit.translatesAutoresizingMaskIntoConstraints = false
        nameOfHabit.textAlignment = .center
        nameOfHabit.backgroundColor = UIColor.lightGray
        nameOfHabit.layer.cornerRadius = 3
        nameOfHabit.text = "Name"
        nameOfHabit.numberOfLines = 0
        nameOfHabit.font = UIFont.systemFont(ofSize: 24)
        nameOfHabit.textColor = .white
        view.addSubview(nameOfHabit)

        habitTxt = UITextField()
        habitTxt.translatesAutoresizingMaskIntoConstraints = false
        habitTxt.textAlignment = .center
        habitTxt.layer.cornerRadius = 5
        habitTxt.backgroundColor = .lightGray
        habitTxt.textColor = .white
        habitTxt.font = UIFont.systemFont(ofSize: 24)
        view.addSubview(habitTxt)

        saveBTN = UIButton()
        saveBTN.translatesAutoresizingMaskIntoConstraints = false
        saveBTN.setTitle("Save", for: .normal)
        saveBTN.layer.cornerRadius = 5
        saveBTN.backgroundColor = UIColor.lightGray
        saveBTN.addTarget(self, action: #selector(addHabit), for: .touchUpInside)
         view.addSubview(saveBTN)

        NSLayoutConstraint.activate([
        
            nameOfHabit.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20),
            nameOfHabit.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            nameOfHabit.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),
            
            habitTxt.topAnchor.constraint(equalTo: nameOfHabit.bottomAnchor, constant: 20),
            habitTxt.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            habitTxt.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20),

            saveBTN.topAnchor.constraint(equalTo: habitTxt.bottomAnchor, constant: 20),
            saveBTN.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor, constant: -20),
            saveBTN.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: +20)

            ])

        
    }
}

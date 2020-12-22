//
//  SummaryViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//

import UIKit
import FirebaseAuth
import Firebase

class SummaryViewController: UIViewController {

    @IBOutlet weak var sum: UIButton!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var loadData: UIButton!
    @IBOutlet weak var listOftenEmotions: UITextView!
    @IBOutlet weak var oftenEmotion: UILabel!
    var emotionArray = [0,0,0,0,0,0]
    var oftenEm = [String]()
    var isLoad:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackGround()
        loadData.setProperties()
        sum.setProperties()
        logoutButton.setProperties()
        if UserDefaults.standard.string(forKey: "LIST_OF_EM") != "" { self.listOftenEmotions.text = UserDefaults.standard.string(forKey: "LIST_OF_EM") }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "LIST_OF_EM") != "" { self.listOftenEmotions.text = UserDefaults.standard.string(forKey: "LIST_OF_EM") }
    }
    
    @IBAction func loadData(_ sender: UIButton) {
        self.isLoad = true
        if REF_CURRENT_USER != nil {
            DataService.dataServise.REF_NOTES.observe(.value, with: {(snapshot) in
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        if let noteData = snap.value as? [String: Any] {
                            let note = Note(dictionary: noteData)
                            if note.emotion == "Счастье" { self.emotionArray[0] += 1}
                            if note.emotion == "Радость"{ self.emotionArray[1] += 1 }
                            if note.emotion == "Веселье" { self.emotionArray[2] += 1 }
                            if note.emotion == "Гнев" { self.emotionArray[3] += 1 }
                            if note.emotion == "Грусть" { self.emotionArray[4] += 1 }
                            if note.emotion == "Апатия"{ self.emotionArray[5] += 1 }
                        }
                    }
                }
            })
        }
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func makeSum(_ sender: UIButton) {
        if (isLoad){
        UserDefaults.standard.setValue("", forKey: "LIST_OF_EM")
        self.listOftenEmotions.text = ""
            let what = self.emotionArray.max()
            var i = 0
            while i < self.emotionArray.count {
                if self.emotionArray[i] == what {
                    switch i {
                    case 0: self.oftenEm.append("Вы испытывали счастье \(self.emotionArray[i]) раз")
                    case 1: self.oftenEm.append("Вы испытывали радость \(self.emotionArray[i]) раз")
                    case 2: self.oftenEm.append("Вы испытывали веселье \(self.emotionArray[i]) раз")
                    case 3: self.oftenEm.append("Вы испытывали гнев \(self.emotionArray[i]) раз")
                    case 4: self.oftenEm.append("Вы испытывали грусть \(self.emotionArray[i]) раз")
                    case 5: self.oftenEm.append("Вы испытывали апатия \(self.emotionArray[i]) раз")
                    default:
                        break
                    }
                    
                }
                i += 1
            }
            i = 0
            while i < self.oftenEm.count {
                self.listOftenEmotions.text += self.oftenEm[i] + "\n"
                i += 1
            }
            UserDefaults.standard.setValue(self.listOftenEmotions.text, forKey: "LIST_OF_EM")
                self.emotionArray = [0,0,0,0,0,0]
                self.oftenEm = [String]()
            self.isLoad = false
        }
        else {
            showAlert(message: "Загрузите данные")
        }
    }
    
    @IBAction func logoutAction(_ sender: Any) {
        UserDefaults.standard.setValue("", forKey: "LIST_OF_EM")
        try! Auth.auth().signOut()
    }

}

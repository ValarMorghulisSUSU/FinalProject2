//
//  NotesViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//
import Foundation
import RealmSwift
import UIKit
//import Notes

class NotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource {
    
    
    // MARK: - from StoryBoard
    @IBOutlet weak var descrpText: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableNotes: UITableView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    // MARK: - programm atributes
    let emotionArray: Array = ["Счастье", "Радость", "Веселье", "Гнев", "Грусть", "Апатия"]
    let rateArray: Array = [1,2,3,4,5,6,7,8,9,10]
    var note:Note = .init()
    var notesArray: Array<Note> = []
    
    
    // MARK: - only viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emotionPicker.delegate = self
        ratePicker.delegate = self
        emotionPicker.dataSource = self
        ratePicker.dataSource = self
        tableNotes.dataSource = self
        tableNotes.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "indexCell")
        viewWillAppear: do {
            datePicker.maximumDate = Date()
        }
    }
    
    
    //MARK: - button func
    @IBAction func addNote(_ sender: Any) {
        plusButton.shake()
        note = .init(emotion: emotionArray[emotionPicker.selectedRow(inComponent: 0)], rate: rateArray[ratePicker.selectedRow(inComponent: 0)], desctiption: descrpText.text!)
        notesArray.append(note)
        tableNotes.beginUpdates()
        tableNotes.insertRows(at: [IndexPath(row: notesArray.count-1, section: 0)], with: .automatic)
        tableNotes.endUpdates()
    }
    
    
    //MARK: - for UIPickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch pickerView {
        case emotionPicker:
            return emotionArray.count
        case ratePicker:
            return rateArray.count
        default:
            return 1
        }
    }
    private func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) -> String {
        switch pickerView {
        case emotionPicker:
            return emotionArray[row]
        case ratePicker:
            return String(rateArray[row])
        default:
            return "nothing"
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            switch pickerView {
            case emotionPicker:
                return emotionArray[row]
            case ratePicker:
                return String(rateArray[row])
            default:
                return "nothing"
            }
        }
    
    
    //MARK: - for UITableView
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (notesArray.count == 0) {
            return 0
        }
        else {
            return notesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! TableViewCell
        newCell.setUp(emotion: note.emotion, rate: note.rate, description: note.description)
        return newCell
    }
}


extension UIButton {
    func shake() {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
            layer.add(animation, forKey: "shake")
        }
}

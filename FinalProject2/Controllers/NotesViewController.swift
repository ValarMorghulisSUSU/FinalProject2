//
//  NotesViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//
import Foundation
import RealmSwift
import UIKit


extension UIButton {
    func shake() {
            let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
            animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
            animation.duration = 0.6
            animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
            layer.add(animation, forKey: "shake")
        }
}

class NotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITabBarDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableNotes: UITableView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    let emotionArray: Array = ["Счастье", "Радость", "Веселье", "Гнев", "Грусть", "Апатия"]
    let rateArray: Array = [1,2,3,4,5,6,7,8,9,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emotionPicker.delegate = self
        ratePicker.delegate = self
        emotionPicker.dataSource = self
        ratePicker.dataSource = self
        tableNotes.dataSource = self
        viewWillAppear: do {
            datePicker.maximumDate = Date()
        }
         //tableNotes.delegate = self
    }
    
    @IBAction func addNote(_ sender: Any) {
        plusButton.shake()
    }
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! dairyTableViewCell
        return cell
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


class Notes {
    private var notesURL: URL {URL(string: "http://psy.desfeuers.ru/")!}
    
    
}

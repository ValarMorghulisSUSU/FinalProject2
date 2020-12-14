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

class NotesViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDataSource {
    
    
    
    @IBOutlet weak var descrpText: UITextField!
    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var tableNotes: UITableView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    let emotionArray: Array = ["Счастье", "Радость", "Веселье", "Гнев", "Грусть", "Апатия"]
    let rateArray: Array = [1,2,3,4,5,6,7,8,9,10]
    var note:Note = .init()
    var notesArray: Array<Note> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        emotionPicker.delegate = self
        ratePicker.delegate = self
        emotionPicker.dataSource = self
        ratePicker.dataSource = self
        tableNotes.register(dailyTableViewCell.self, forCellReuseIdentifier: "indexCell")
        tableNotes.dataSource = self
        viewWillAppear: do {
            datePicker.maximumDate = Date()
        }
         //tableNotes.delegate = self
    }
    
    @IBAction func addNote(_ sender: Any) {
        plusButton.shake()
        //tableView(<#T##tableView: UITableView##UITableView#>, cellForRowAt: <#T##IndexPath#>)
       // let note: Notes
//        note = emotionArray[emotionPicker.selectedRow(inComponent: 0)] + String(rateArray[ratePicker.selectedRow(inComponent: 0)]) + descrpText.text!
        note.setNote(emotion: emotionArray[emotionPicker.selectedRow(inComponent: 0)], rate: rateArray[ratePicker.selectedRow(inComponent: 0)], desctiption: descrpText.text!)
        notesArray.append(note)
        tableNotes.beginUpdates()
        tableNotes.insertRows(at: [IndexPath(row: notesArray.count-1, section: 0)], with: .automatic)
        tableNotes.endUpdates()
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (notesArray.count == 0) {
            return 0
        }
        else {
            return notesArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let newCell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as! dailyTableViewCell
        if (notesArray.count != 0){
            newCell.mycell.text = "dasda"
            print(newCell.mycell.text)
            //newCell.cell.text = "dasdasd"
            //print(newCell.cell.text)
            //newCell.cell.text = "dsadsa"
          //  cell.setUp(emotion: notesArray[indexPath.row].emotion, rate: notesArray[indexPath.row].rate, description: notesArray[indexPath.row].description)
        }
        return newCell
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
class Note  {
    var rate: Int
    var emotion: String
    var description: String
    
    func setNote(emotion em: String, rate r: Int, desctiption d:String){
        self.emotion = em
        self.rate = r
        self.description = d
    }
    init(emotion em: String, rate r: Int, desctiption d:String){
        self.emotion = em
        self.rate = r
        self.description = d
    }
    init() {
        self.emotion = ""
        self.rate = 0
        self.description = ""
    }
}

//final class Notes {
//    private var notesURL: URL {URL(string: "http://psy.desfeuers.ru/list")!}
//    private unowned var view: UIViewController
//    var rate: Int
//    var emotion: String
//    var description: String
//
//    func setNote(emotion em: String, rate r: Int, desctiption d:String){
//        self.emotion = em
//        self.rate = r
//        self.description = d
//    }
//    init(view: UIViewController){
//        self.view = view
//    }
//
//
//}

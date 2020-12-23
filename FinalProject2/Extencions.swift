//
//  Extencions.swift
//  FinalProject2
//
//  Created by Mac on 23.12.2020.
//

import Foundation
import UIKit


extension UIButton {
    func setCustomProperties() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.3349651098, green: 0.24038589, blue: 0.1995852292, alpha: 1)
        self.setTitleColor(.white, for: UIControl.State.normal)
    }
    func shake() {
        let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animation.duration = 0.6
        animation.values = [-10.0, 10.0, -10.0, 10.0, -5.0, 5.0, -2.0, 2.0, 0.0 ]
        layer.add(animation, forKey: "shake")
    }
}


extension UIViewController {
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func setCustomBackGroundColor() {
        self.view.backgroundColor = #colorLiteral(red: 0.9947852492, green: 0.8737735748, blue: 0.7918055654, alpha: 1)
    }
}

//MARK: - NotesViewController extensions for UIPickerView
extension NotesViewController: UIPickerViewDelegate {
   
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
}

extension NotesViewController: UIPickerViewDataSource {
    
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
}

//MARK: - NotesViewController extensions for UITableView
extension NotesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            DataService.dataServise.deleteNote(key: notesArray[indexPath.row].snapkey)
            notesArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var note: Note!
        note = notesArray[indexPath.row]
        if let newCell = tableView.dequeueReusableCell(withIdentifier: "indexCell", for: indexPath) as? TableViewCell {
            newCell.setUp(emotion: note.emotion, rate: note.rate, description: note.description)
            return newCell }
        else {
            return TableViewCell()
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
    
}

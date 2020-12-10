//
//  NotesViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//

import UIKit

class NotesViewController: UIViewController {

    @IBOutlet weak var tableNotes: UITableView!
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var ratePicker: UIPickerView!
    @IBOutlet weak var emotionPicker: UIPickerView!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    
    let emotionArray: Array = [""]
    let rateArray: Array = [1,2,3,4,5,6,7,8,9,10]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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

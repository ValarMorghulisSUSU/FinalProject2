//
//  NotesViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//
import Foundation
import UIKit
import Firebase

class NotesViewController: UIViewController {
    
    
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
    //var note:Note = .init()
    var newNote: [String: Any] = [:]
    var notesArray = [Note]()
    var date: String = ""
    
    
    // MARK: - only viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.setCustomBackGroundColor()
        emotionPicker.delegate = self
        ratePicker.delegate = self
        emotionPicker.dataSource = self
        ratePicker.dataSource = self
        tableNotes.dataSource = self
        tableNotes.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "indexCell")
        viewWillAppear: do {
            datePicker.maximumDate = Date()
        }
        datePicker.addTarget(self, action: #selector(datePickerChanged(picker:)), for: .valueChanged)

    }
    override func viewWillAppear(_ animated: Bool) {
        if REF_CURRENT_USER == nil { REF_CURRENT_USER = Auth.auth().currentUser?.uid }
        stringDate()
        loadTable()
    }
    
    //MARK: - button func
    @IBAction func editTable(_ sender: Any) {
        tableNotes.isEditing.toggle()
    }
    
    func loadTable(){
        if REF_CURRENT_USER != nil {
            DataService.dataServise.REF_NOTES.observe(.value, with: {(snapshot) in
                self.notesArray.removeAll()
                if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                    for snap in snapshot {
                        if let noteData = snap.value as? [String: Any] {
                            let note = Note(dictionary: noteData)
                            if note.date == self.date{
                                self.notesArray.insert(note, at: 0)
                                note.snapkey = snap.key
                            }
                        }
                    }
                }
                self.tableNotes.reloadData()
            })
        }
    }
    @objc func datePickerChanged(picker: UIDatePicker) {
        stringDate()
        loadTable()
    }
    
    func stringDate() {
        let day = datePicker.calendar.component(.day, from: datePicker.date)
        let month = datePicker.calendar.component(.month, from: datePicker.date)
        let year = datePicker.calendar.component(.year, from: datePicker.date)
        self.date = "\(day).\(month).\(year)"
    }
    @IBAction func addNote(_ sender: Any) {
        plusButton.shake()
        let day = datePicker.calendar.component(.day, from: datePicker.date)
        let month = datePicker.calendar.component(.month, from: datePicker.date)
        let year = datePicker.calendar.component(.year, from: datePicker.date)
        newNote = [
            "date": "\(day).\(month).\(year)",
            "emotion": emotionArray[emotionPicker.selectedRow(inComponent: 0)],
            "rate": rateArray[ratePicker.selectedRow(inComponent: 0)],
            "description": descrpText.text ?? ""
        ]
        DataService.dataServise.createNewNote(note: newNote)

    }
}





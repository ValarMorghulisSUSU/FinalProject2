//
//  Notes.swift
//  FinalProject2
//
//  Created by Mac on 15.12.2020.
//

import UIKit
import Foundation
import Firebase
let URL_BASE = Database.database().reference()
var REF_CURRENT_USER = Auth.auth().currentUser?.uid

class DataService {
    static let dataServise = DataService()

    var REF_BASE = URL_BASE
    var REF_USERS = URL_BASE.child("users")
    var REF_NOTES = URL_BASE.child("users").child(REF_CURRENT_USER!).child("Notes")
    
    func createNewNote(note: [String: Any]) {
        let firebaseNewNote = REF_NOTES.childByAutoId()
        firebaseNewNote.setValue(note)
    }
    func deleteNote(key: String) {
        Database.database().reference().child("users").child(REF_CURRENT_USER!).child("Notes").child(key).removeValue()
    }
}
final class Note  {
    var snapkey: String = ""
    var date: String!
    var rate: Int!
    var emotion: String!
    var description: String!
    
    init(date dat: String, emotion em: String, rate r: Int, desctiption d:String){
        self.emotion = em
        self.rate = r
        self.description = d
        self.date = dat
    }
    init(dictionary: [String: Any]) {
        self.emotion = dictionary["emotion"] as? String
        self.rate = dictionary["rate"] as? Int
        self.date = dictionary["date"] as? String
        self.description = dictionary["description"] as? String
    }
}


//
//  Notes.swift
//  FinalProject2
//
//  Created by Mac on 15.12.2020.
//
import UIKit
import Foundation

final class Note  {
    var rate: Int
    var emotion: String
    var description: String
    
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
//
//
//}

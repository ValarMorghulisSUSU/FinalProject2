//
//  TableViewCell.swift
//  FinalProject2
//
//  Created by Mac on 15.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var customNote: UILabel!

    
    func setUp(emotion em:String, rate re: Int, description d: String){
        if (re>0 && re < 5) {
            if (d == "") { customNote.text = (em + " - " + "\(re) балл") }
            else { customNote.text = (em + " - " + "\(re) балл - " + d) }
        }
        else {
            if (d == "") { customNote.text = (em + " - " + "\(re) баллов") }
            else { customNote.text = (em + " - " + "\(re) баллов - " + d) }
        }
    }
    

}

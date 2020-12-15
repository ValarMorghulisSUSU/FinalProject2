//
//  TableViewCell.swift
//  FinalProject2
//
//  Created by Mac on 15.12.2020.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var customNote: UILabel!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    func setUp(emotion em:String, rate re: Int, description d: String){
        if (re>0 && re < 5) {
        customNote.text! = (em + " - " + "\(re) балл - " + d)
        }
        else {
        customNote.text! = (em + " - " + "\(re) баллов - " + d)
        }
    }
    
}

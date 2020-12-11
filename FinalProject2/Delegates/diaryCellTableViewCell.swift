//
//  diaryCellTableViewCell.swift
//  FinalProject2
//
//  Created by Mac on 11.12.2020.
//

import UIKit

class dairyTableViewCell: UITableViewCell {

    @IBOutlet weak var cellNote: UILabel!
    
    func setUp(emotion em:String, rate re: Int, description d: String){
        if (re>0 && re < 5) {
        cellNote.text = em + " - " + "\(re) балл - " + d
        }
        else {
            cellNote.text = em + " - " + "\(re) баллов - " + d
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

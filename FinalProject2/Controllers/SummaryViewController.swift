//
//  SummaryViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//

import UIKit
import FirebaseAuth
//let isLogin:Bool = fals

class SummaryViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var weekSum: UIButton!
    @IBOutlet weak var nowSum: UIButton!
    @IBOutlet weak var monthSum: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoutButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func logoutAction(_ sender: Any) {
        try! Auth.auth().signOut()
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

//
//  ViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//

import UIKit
//class newUser {
//    unowned var view:ViewController
//    init(view: ViewController) {
//        self.view = view
//    }
//
//    func viewDidLoad() {
//    }
//}

class LogInViewController: UIViewController {

    @IBOutlet weak var signInButton: UIButton!
    // var login: UserDefaults
   // var password: UserDefaults
    
    //private lazy var newuser: newUser
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
    func logIN(){
        
    }

}

class BeginViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.setProperties()
        signInButton.setProperties()
        // Do any additional setup after loading the view.
    }
}


class RegisterViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signUpButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
}


extension UIButton {
    func setProperties() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 1
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = .init(red: 255, green: 232, blue:188, alpha: 1)
        self.setTitleColor(.black, for: UIControl.State.normal)
        //self.
    }
}

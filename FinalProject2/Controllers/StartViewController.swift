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
        self.setBackGround()    
        // Do any additional setup after loading the view.
    }
    
    func logIN(){
        
    }
}

class BeginViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var collectionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackGround()
        collectionView.backgroundColor = self.view.backgroundColor
        signUpButton.setProperties()
        signInButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
}


class RegisterViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackGround()
        signUpButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
}



extension UIButton {
    func setProperties() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        //self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.3349651098, green: 0.24038589, blue: 0.1995852292, alpha: 1)
        self.setTitleColor(.white, for: UIControl.State.normal)
        //self.
    }
    
}

extension UIViewController {
    
    func setBackGround() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8443579078, blue: 0.7095828652, alpha: 1)
    }
}



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
    
    @IBOutlet weak var myLabel: UILabel!
    //private lazy var newuser: newUser
    override func viewDidLoad() {
        super.viewDidLoad()
        signInButton.setProperties()
        self.setBackGround()
        myLabel.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    func logIN(){
        
    }
    
    @IBAction func sendToSignUp(_ sender: UITapGestureRecognizer) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "signUp") as! RegisterViewController
        let appDelegate =  UIApplication.shared.delegate as! AppDelegate
        appDelegate.window
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}

class BeginViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var signInButton: UIButton!
    
    @IBOutlet weak var collectionView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setBackGround()
        collectionView.backgroundColor = self.view.backgroundColor
        signUpButton.setProperties()
        signInButton.setProperties()
        // Do any additional setup after loading the view.
    }
    
}


class RegisterViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackGround()
        signUpButton.setProperties()
        myLabel.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    @IBAction func sendToSignIn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "logIn") as! LogInViewController
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
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



//
//  ViewController.swift
//  FinalProject2
//
//  Created by Mac on 10.12.2020.
//

import UIKit
import SwiftUI
import FirebaseAuth
import FirebaseDatabase
import Firebase

class AuthViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var buttonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var repasTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var repasLabel: UILabel!
    @IBOutlet weak var changebleLabel: UILabel!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mainConstraint: NSLayoutConstraint!
    
    var signin: Bool = true {
        willSet {
            if newValue{
                label.text = "  ВХОД  "
                repasLabel.isHidden = true
                repasTextField.isHidden = true
                authButton.setTitle("  ВОЙТИ  ", for: .normal)
                changebleLabel.text = "Ещё нет аккаунта ? Зарегистрируйстесь."
            }
            else {
                label.text = "  РЕГИСТРАЦИЯ  "
                repasLabel.isHidden = false
                repasTextField.isHidden = false
                authButton.setTitle("  ЗАРЕГИСТРИРОВАТЬСЯ  ", for: .normal)
                changebleLabel.text = "Уже есть аккаунт ? Войдите."
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signin = true
        self.setBackGround()
        authButton.setProperties()
        changebleLabel.isUserInteractionEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            buttonTopConstraint.constant = 80
            mainConstraint.constant = -30
            if signin { buttonTopConstraint.constant -= keyboardSize.height/2.5}
            else {
                mainConstraint.constant = -70
                buttonTopConstraint.constant -= keyboardSize.height/4
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification){
        mainConstraint.constant = -30
        buttonTopConstraint.constant = 80
    }
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repasTextField.resignFirstResponder()
    }
    @IBAction func auth(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let repassword = repasTextField.text!
        if (signin) {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password, completion:
                                    { (result, error) in
                                        if error == nil {self.dismiss(animated: true, completion: nil)
                                    }
                                    })
            } else {showAlert(message: "Заполните все поля") }
        } else {
            if(!email.isEmpty && !password.isEmpty && !repassword.isEmpty && password == repassword) {
                Auth.auth().createUser(withEmail: email, password: password, completion:
                                        { (result, error) in
                                            if error == nil {
                                                if let result = result {
                                                    let ref = Database.database().reference().child("users")
                                                    ref.child(result.user.uid).updateChildValues(["email": email])
                                                    self.dismiss(animated: true, completion: nil)
                                                }
                                            } else {self.showAlert(message: error.debugDescription)}
                                        })
            }
            else { showAlert(message: "Заполните все поля или проверьте совпадение паролей") }
        }
    }
    
    
    @IBAction func changeAuth(_ sender: UITapGestureRecognizer) {
        signin.toggle()
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "ОК", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}

extension UIButton {
    
    func setProperties() {
        self.layer.cornerRadius = 10
        self.layer.borderWidth = 2
        self.layer.borderColor = .init(red: 0, green: 0, blue: 0, alpha: 1)
        self.backgroundColor = #colorLiteral(red: 0.3349651098, green: 0.24038589, blue: 0.1995852292, alpha: 1)
        self.setTitleColor(.white, for: UIControl.State.normal)
    }
}

extension UIViewController {
    
    func setBackGround() {
        self.view.backgroundColor = #colorLiteral(red: 1, green: 0.8443579078, blue: 0.7095828652, alpha: 1)
    }
}



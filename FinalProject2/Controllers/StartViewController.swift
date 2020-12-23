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
import FirebaseStorage
import FirebaseUI
enum Authentication {
    case login
    case signup
}
class AuthViewController: UIViewController {
    
    @IBOutlet weak var imageVIew: UIImageView!
    @IBOutlet weak var buttonBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var repasTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var repasLabel: UILabel!
    @IBOutlet weak var changebleLabel: UILabel!
    @IBOutlet weak var authButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var mainConstraint: NSLayoutConstraint!
    
    var state: Authentication = .login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let storage = Storage.storage()
        let sref = storage.reference()
        let ref = sref.child("IMG_5185-removebg.png")
        imageVIew.sd_setImage(with: ref)
        redrawView()
        self.setCustomBackGroundColor()
        authButton.setCustomProperties()
        changebleLabel.isUserInteractionEnabled = true
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    
    //MARK: - for keyboard
    @objc func keyboardWillShow(notification: NSNotification){
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            buttonBottomConstraint.constant = 100
            mainConstraint.constant = -30
            if state == .login {
                mainConstraint.constant = -70
                buttonBottomConstraint.constant = keyboardSize.height
                
            }
            else {
                mainConstraint.constant = -70
                buttonBottomConstraint.constant = keyboardSize.height
            }
        }
    }
    @objc func keyboardWillHide(notification: NSNotification){
        mainConstraint.constant = -30
        buttonBottomConstraint.constant = 100
    }
    
    
    
    //MARK: - @IBAcrion
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        repasTextField.resignFirstResponder()
    }
    @IBAction func auth(_ sender: Any) {
        let email = emailTextField.text!
        let password = passwordTextField.text!
        let repassword = repasTextField.text!
        if state == .login {
            if (!email.isEmpty && !password.isEmpty) {
                Auth.auth().signIn(withEmail: email, password: password, completion:
                                    { (result, error) in
                                        if error == nil {self.dismiss(animated: true, completion: nil)
                                    }
                                    })
            } else {showErrorAlert(message: "Заполните все поля") }
        } else {
            if(!email.isEmpty && !password.isEmpty && !repassword.isEmpty) {
                if ( password == repassword ) {
                Auth.auth().createUser(withEmail: email, password: password, completion:
                                        { (result, error) in
                                            if error == nil {
                                                if let result = result {
                                                    let ref = Database.database().reference().child("users")
                                                    ref.child(result.user.uid).updateChildValues(["email": email])
                                                    self.dismiss(animated: true, completion: nil)
                                                }
                                            } else {self.showErrorAlert(message: error.debugDescription)}
                                        })
                } else { showErrorAlert(message: "Пароли не совпадают")}
            }
            else { showErrorAlert(message: "Заполните все поля") }
        }
    }
    
    
    @IBAction func changeAuth(_ sender: UITapGestureRecognizer) {
        if state == .login { state = .signup }
        else { state = .login }
        redrawView()
    }
    
    //MARK: - for change enum
    
    func redrawView(){
        switch state {
        case .login:
            repasLabel.isHidden = true
            repasTextField.isHidden = true
            authButton.setTitle("  ВОЙТИ  ", for: .normal)
            changebleLabel.text = "Ещё нет аккаунта ? Зарегистрируйстесь."
        case .signup:
            repasLabel.isHidden = false
            repasTextField.isHidden = false
            authButton.setTitle("  ЗАРЕГИСТРИРОВАТЬСЯ  ", for: .normal)
            changebleLabel.text = "Уже есть аккаунт ? Войдите."
        }
    }
}





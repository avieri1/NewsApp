//
//  LoginVC.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import UIKit

protocol LoginViewInterface {
    var presenter: LoginPresenterInterface? { get set }

    func setupView()
    func showView(with result: String)

}

class LoginVC: UIViewController,LoginViewInterface,UIGestureRecognizerDelegate {
    
    var presenter: LoginPresenterInterface?
    
    @IBOutlet weak var usernameLbl: UILabel!
    @IBOutlet weak var passwordLbl: UILabel!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var passwordToggle: UIImageView!
    @IBOutlet weak var errorLbl: UILabel!
    
    enum errorText {
        case PasswordUsernameEmpty
        case PasswordUsernameWrong
    }
    
    func setupView() {
        title = "Login"
        usernameLbl.text = "Username"
        passwordLbl.text = "Password"
        loginBtn.layer.cornerRadius = 8
        let passwordToggleClicked = UITapGestureRecognizer(target: self, action: #selector(self.togglePassword))
        passwordToggle.addGestureRecognizer(passwordToggleClicked)
    }
    
    func showView(with result: String) {
        if result == "magnus" {
            presenter?.viewPushToHome(with: "magnus")
        }
        else{
            showError(error: .PasswordUsernameWrong)
        }
    }
    
    func showError(error: errorText) {
        errorLbl.isHidden = false
        switch error {
        case .PasswordUsernameEmpty:
            errorLbl.text = "Username/Password is Empty"
            print("Credentials empty")
        case .PasswordUsernameWrong:
            errorLbl.text = "Wrong Username/Password"
            print("Invalid credentials")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        presenter?.notifyViewDidLoad()

    }

    @IBAction func loginBtnClicked(_ sender: Any) {
        
        let salt = "123456"
        guard let username = usernameTextField.text else { return }
        guard let pass = passwordTextField.text else { return }
        
        if username == "" || pass == "" {
            showError(error: .PasswordUsernameEmpty)
        }
        else{
            if let encrypted = encrypt(text: pass, salt: salt) {
                presenter?.viewDidLogin(with: username, with: encrypted)
            }
        }
    }
    
    @IBAction func usernameDidType(_ sender: Any) {
        errorLbl.isHidden = true
    }
    
    @IBAction func passwordDidType(_ sender: Any) {
        errorLbl.isHidden = true
    }
    
    @objc func togglePassword() {
        if passwordTextField.isSecureTextEntry == true{
            passwordTextField.isSecureTextEntry.toggle()
            passwordToggle.image = UIImage.init(systemName: "eye")
        }
        else{
            passwordTextField.isSecureTextEntry.toggle()
            passwordToggle.image = UIImage.init(systemName: "eye.slash")
        }
    }
}

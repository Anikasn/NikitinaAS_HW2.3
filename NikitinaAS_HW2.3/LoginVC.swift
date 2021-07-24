//
//  ViewController.swift
//  NikitinaAS_HW2.3
//
//  Created by Анна Никитина on 14.07.2021.
//

import UIKit

class LoginVC: UIViewController {
    
// MARK: - IB Outlets
    @IBOutlet weak var UserNameTF: UITextField!
    @IBOutlet weak var PasswordTF: UITextField!
    @IBOutlet weak var LogInButton: UIButton!
    
//MARK: - Private Properties
    private let user = "User"
    private let password = "Password"
    
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeVC else {
            return
        }
        welcomeVC.user = user
    }

//MARK: - IB Actions
    @IBAction func LogInPressed() {
        if UserNameTF.text != user || PasswordTF.text != password { showAlert(
                title: "Invalid login or password",
                message: "Please, enter correct login and password",
                textField: PasswordTF
            )
            return
        }
        performSegue(withIdentifier: "showWelcomeVC", sender: nil)
    }
    
    @IBAction func ForgotUserNameAction(_ sender: UIButton) {
        showAlert(title: "Oops!",
                  message: "Your name is \(user) 😉")
    }
    
    @IBAction func ForgotPasswordAction(_ sender: UIButton) {
        showAlert(title: "Oops!",
                  message: "Your password is \(password) 😉")
    }
}

//MARK: - Private Methods
extension LoginVC {
    private func showAlert(title: String, message: String, textField: UITextField? = nil) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in textField?.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

// MARK: - Work whith keyboard
extension LoginVC: UITextFieldDelegate {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == UserNameTF { PasswordTF.becomeFirstResponder()
        } else {
            LogInPressed()
        }
        return true
    }
}

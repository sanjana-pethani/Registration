//
//  ViewController.swift
//  Registration
//
//  Created by Sanjana pethani on 21/12/22.
//

import UIKit

class RegistrasiionViewController: UIViewController {
    
    @IBOutlet weak var fullNameTextField: UITextField!
    @IBOutlet weak var birthdateTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPaswordTextfield: UITextField!
    @IBOutlet weak var registrationButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
        
    }
    
    private func setUp(){
        [fullNameTextField,birthdateTextField,passwordTextField,confirmPaswordTextfield,registrationButton].forEach{
            setCornerRadious(view: $0, cornerRadious: 10)
        }
        fullNameTextField.delegate = self
        passwordTextField.delegate = self
        confirmPaswordTextfield.delegate = self
    }
    
    func setCornerRadious(view: UIView?, cornerRadious: CGFloat){
        view?.layer.cornerRadius = cornerRadious
        view?.layer.masksToBounds = true
    }
    
    
    func displayAlert(message: String){
        let alert: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let okButton:UIAlertAction = UIAlertAction(title: "Ok", style: .default){button in
            print("Please Check Information")
        }
        alert.addAction(okButton)
        present(alert, animated: true)
    }
    
    
    @IBAction func registrasionButtonTapped(_ sender: UIButton) {
        
        if fullNameTextField.text == " " || passwordTextField.text == " " || confirmPaswordTextfield.text == " "{
            displayAlert(message: "Enter valid UserName And Password")
        }
        else if passwordTextField.text?.count ?? 0 < 4 || passwordTextField.text?.count ?? 0 > 8 {
            displayAlert(message: "Enter Strong Password")
        }
        else if passwordTextField.text != confirmPaswordTextfield.text{
           displayAlert(message: "Does Not Match Password")
            
        }
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let loginViewController: LoginViewController = storyBoard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginViewController, animated: true)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
}

extension RegistrasiionViewController: UITextFieldDelegate{
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        
        switch textField.tag {
        case 0:
            return true
        case 1:
            return true
        case 2:
            return true
        case 3:
            return true
        default:
            return true
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(textField.tag)
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(textField.text ?? "")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField.tag == 0 {
            if string == "@" {
                return false
            } else {
                return true
            }
        } else if textField.tag == 2 {
            if string.contains("/") {
                return false
            } else {
                return true
            }
        }
        return true
    }
    
}

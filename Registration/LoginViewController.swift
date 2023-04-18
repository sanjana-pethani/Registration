//
//  LoginViewController.swift
//  Registration
//
//  Created by Sanjana pethani on 21/12/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailIdTextField: UITextField!
    @IBOutlet weak var verifyPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
         setUp()
    }
    private func setUp(){
        [emailIdTextField,verifyPasswordTextField,loginButton].forEach{
            setCornerRadious(view: $0, cornerRadious: 10)
        }
        
    }

    func setCornerRadious(view: UIView?, cornerRadious: CGFloat){
        view?.layer.cornerRadius = cornerRadious
        view?.layer.masksToBounds = true
    }
    
    
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let apiControllerViewController: APIControllerViewController = storyBoard.instantiateViewController(withIdentifier: "APIControllerViewController") as! APIControllerViewController
        navigationController?.pushViewController(apiControllerViewController, animated: true)
    }
    
    
    func displayAlert(message: String){
        let alert: UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let tryAgain:UIAlertAction = UIAlertAction(title: "Ok", style: .cancel){button in
            print("Please Check Information")
        }
        alert.addAction(tryAgain)
        present(alert, animated: true)
    }
    

}

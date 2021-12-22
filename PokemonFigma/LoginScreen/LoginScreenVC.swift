//
//  LoginScreenVC.swift
//  PokemonFigma
//
//  Created by Vladislav on 17.12.2021.
//

import UIKit


class LoginScreenVC: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    
    @IBOutlet weak var PasswordTextField: UITextField!
    
    //correct username and password
    let username = "test123@gmail.com"
    let password = "123456"
    
    // adding this constant in order to make a move to other screen when needed
    let homeScreenVC = HomeScreenVC()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round Border for Login Text Field
        LoginTextField.layer.cornerRadius = LoginTextField.frame.size.height/2
        LoginTextField.clipsToBounds = true
        
        
        //Round Border for Password Text Field
        PasswordTextField.layer.cornerRadius = LoginTextField.frame.size.height/2
        PasswordTextField.clipsToBounds = true
        
        
       // Calling Image Setup Extension for both TextFieldViews
        LoginTextField.setupLeftImage(imageName: "LoginIcon")
        PasswordTextField.setupLeftImage(imageName: "PasswordIcon")
        
        // Calling function in order to hide keyboard after tapping anywhere on screen or hitting return key
        configureTextFields()
    }
    
        // Standart text configuring function
    private func configureTextFields() {
        LoginTextField.delegate = self
        PasswordTextField.delegate = self
    }
    
    
    // Login button Actions
    @IBAction func loginButtonAction(_ sender: Any) {
        // Adding alert message and button to dismiss it
        let alert = UIAlertController(title: "Authentication Error", message: "Incorrect Login or Password", preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        
        // If login and password are correct - move to HomeScreenVC, else - display alert
            if LoginTextField.text == username && PasswordTextField.text == password {
                self.navigationController?.pushViewController(homeScreenVC, animated: true)
              } else {
                  // calling alert here
                  present(alert, animated: true, completion: nil)
              }
                }
    }
    
    // An Extension used in order to add ImageView to TextFieldView
    extension UITextField {
        func setupLeftImage(imageName:String){
            // Icon Setup
           let imageView = UIImageView(frame: CGRect(x: 38, y: 15, width: 11, height: 10))
           imageView.image = UIImage(named: imageName)
            // Padding
           let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
           imageContainerView.addSubview(imageView)
           leftView = imageContainerView
           leftViewMode = .always
           self.tintColor = .lightGray
         }
}
// Extension to close keyboard on return key tap
    extension LoginScreenVC: UITextFieldDelegate {
        public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
            textField.resignFirstResponder()
            return true
        }
    }

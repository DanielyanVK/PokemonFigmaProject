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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Round Border for Login Text Field
        LoginTextField.layer.cornerRadius = LoginTextField.frame.size.height/2
        LoginTextField.clipsToBounds = true
        
        
        //Round Border for Password Text Field
        PasswordTextField.layer.cornerRadius = LoginTextField.frame.size.height/2
        PasswordTextField.clipsToBounds = true
        //PasswordTextField.frame.size.height = 40
        
       // Calling Image Setup Extension for both TextFieldViews
        LoginTextField.setupLeftImage(imageName: "LoginIcon")
        PasswordTextField.setupLeftImage(imageName: "PasswordIcon")
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

/* extension UITextField{

   func setLeftImage(imageName:String) {

       let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        imageView.image = UIImage(named: imageName)
       self.leftView = imageView;
       self.leftViewMode = .always
    }
}
*/

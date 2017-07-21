//
//  ViewController.swift
//  Password Autofill
//
//  Created by Anil Varghese on 21/07/17.
//  Copyright © 2017 Anil Varghese. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate{

    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(textDidChange(_:)), name: NSNotification.Name("UITextFieldTextDidChangeNotification"), object: nil)
        signInButton.isEnabled = false
        signInButton.alpha = 0.5
    }
    
    @objc func textDidChange(_ textField:UITextField){
        if !userNameTextField.text!.isEmpty && !passwordTextField.text!.isEmpty{
            signInButton.isEnabled = true
            signInButton.alpha = 1
        }
    }
    
    @IBAction func didTapSignInButton(_ sender:Any){
        let alert = UIAlertController(title: "Success!", message: "😎 Password autofill is cool 😎", preferredStyle: .alert )
        alert.addAction(UIAlertAction(title: "Yeah", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    @IBAction func didTapOutside(_ sender: Any) {
        self.view.endEditing(true)
    }
    
}


//
//  SignInVC.swift
//  Uber App For Rider
//
//  Created by MacBook on 10/20/16.
//  Copyright © 2016 Awesome Tuts. All rights reserved.
//

import UIKit

class SignInVC: UIViewController {
    
    private let RIDER_SEGUE = "RiderVC";
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func logIn(_ sender: AnyObject) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            AuthProvider.Instance.login(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
               
                if message != nil {
                    self.alertTheUser(title: "Problem With Authentication", message: message!);
                } else {
                    UberHandler.Instance.rider = self.emailTextField.text!;
                    
                    self.emailTextField.text = "";
                    self.passwordTextField.text = "";
                    
                    self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                }
                
            });
            
        } else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields");
        }
    }
    @IBOutlet weak var signin: UIView!
    
    @IBAction func signUp(_ sender: AnyObject) {
        
        if emailTextField.text != "" && passwordTextField.text != "" {
            
            AuthProvider.Instance.signUp(withEmail: emailTextField.text!, password: passwordTextField.text!, loginHandler: { (message) in
               
                if message != nil {
                    self.alertTheUser(title: "Problem With Creating A New User", message: message!);
                } else {
                    
                    UberHandler.Instance.rider = self.emailTextField.text!;
                    
                    self.emailTextField.text = "";
                    self.passwordTextField.text = "";
                    
                    self.performSegue(withIdentifier: self.RIDER_SEGUE, sender: nil);
                }
                
            });
            
        } else {
            alertTheUser(title: "Email And Password Are Required", message: "Please enter email and password in the text fields");
        }
        
    }
    
    private func alertTheUser(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil);
        alert.addAction(ok);
        present(alert, animated: true, completion: nil);
    }

} // class















































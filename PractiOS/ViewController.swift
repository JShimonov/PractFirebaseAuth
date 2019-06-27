//
//  ViewController.swift
//  PractiOS
//
//  Created by Joseph Shimonov on 6/25/19.
//  Copyright © 2019 Joseph Shimonov. All rights reserved.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var signinSelector: UISegmentedControl!
    @IBOutlet weak var signInLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var LoginIncorrectLabel: UILabel!
    
    var isSignIn:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        view.setGradientBackground(colorOne: Colors.sapGreen, colorTwo: Colors.secEggplant)
        
        signinButton.layer.cornerRadius = 5
        signinButton.layer.borderWidth = 0.8
        signinButton.layer.borderColor = (Colors.black).cgColor
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func signinSelectorChanged(_ sender: UISegmentedControl) {
        
        // Flip the boolean
        isSignIn = !isSignIn
        
        // Check the bool and set the button and labels
        if isSignIn {
            // Hide the incorrect login info
            self.LoginIncorrectLabel.isHidden = true
            
            signInLabel.text = "Sign In"
            signinButton.setTitle("Sign In", for: .normal)
        } else {
            // Hide the incorrect login info
            self.LoginIncorrectLabel.isHidden = true
            
            // Clear the username and password on the screen (if exists)
            if self.emailTextfield.hasText {
                self.emailTextfield.text = ""
            }
            if self.passwordTextfield.hasText {
                self.passwordTextfield.text = ""
            }
            
            signInLabel.text = "Register"
            signinButton.setTitle("Register", for: .normal)
        }
        
    }
    
    @IBAction func signinButtonTapped(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let pass = passwordTextfield.text
        {
        
            // Check if it's sign in or register
            if isSignIn {
                // Sign in the user with Firebase
                Auth.auth().signIn(withEmail: email, password: pass, completion: { (user, error) in
                    self.LoginIncorrectLabel.isHidden = true
                    //Check that user isn't nil
                    if let u = user {
                        // User is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        // Error: check error and show message
                        self.LoginIncorrectLabel.text = "Your email and/or password is incorrect"
                        self.LoginIncorrectLabel.isHidden = false
                        self.LoginIncorrectLabel.textColor = UIColor.red
                    }
                    
                })
                
            } else {
                // Register the user with Firebase
                Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                    self.LoginIncorrectLabel.isHidden = true
                    //Check that user isn't nil
                    if let u = user {
                        // User is found, go to home screen
                        self.performSegue(withIdentifier: "goToHome", sender: self)
                    } else {
                        // Error: check error and show message
                    }
                })
            }
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        // Dismissed the keyboard when the view is tapped on
        emailTextfield.resignFirstResponder()
        passwordTextfield.resignFirstResponder()
    }
    
}


//
//  LoginViewController.swift
//  Squad
//
//  Created by Michael Vieth on 12/3/15.
//  Copyright © 2015 Michael Vieth. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI
import UIKit

class LoginViewController: UIViewController, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate {
    
    var loginViewController : PFLogInViewController! = PFLogInViewController()
    var signUpViewController : PFSignUpViewController! = PFSignUpViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if (PFUser.currentUser() == nil) {
            self.loginViewController.fields = [PFLogInFields.UsernameAndPassword, PFLogInFields.LogInButton , PFLogInFields.SignUpButton , PFLogInFields.PasswordForgotten , PFLogInFields.DismissButton]
            
            let loginLogoTitle = UILabel()
            loginLogoTitle.text = "Squad"
            
            self.loginViewController.logInView?.logo = loginLogoTitle
            
            self.loginViewController.delegate = self
            
            let signUpLogoTitle = UILabel()
            signUpLogoTitle.text = "Squad"
            
            self.signUpViewController.signUpView?.logo = signUpLogoTitle
            
            self.signUpViewController.delegate = self
            
            self.loginViewController.signUpController = self.signUpViewController
        }

    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: Parse Login / Logout
    
    func logInViewController(logInController: PFLogInViewController, shouldBeginLogInWithUsername username: String, password: String) -> Bool {
        
        // check username and password
        if (!username.isEmpty || !password.isEmpty){
            return true
        } else{
            return false
        }
        
    }
    
    func logInViewController(logInController: PFLogInViewController, didFailToLogInWithError error: NSError?) {
        print("Failed to login")
    }
    
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser) {
        print("Did login user.")
        // need to make segue
        print("Dismissing loginViewController")
        self.dismissViewControllerAnimated(true, completion: nil)
        
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("Home") as UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
        
    }
    
    @IBAction func logout() {
        PFUser.logOut()
        print("User logout")
    }
    
    
    // MARK: Parse Sign Up
    
    func signUpViewController(signUpController: PFSignUpViewController, didFailToSignUpWithError error: NSError?) {
        print("Failed to sign up user.")
    }
    
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser) {
        print("Sign Up User.")
        self.dismissViewControllerAnimated(true, completion: nil)
        print("User \(user.username) did log in.")
        
    }
    
    func signUpViewControllerDidCancelSignUp(signUpController: PFSignUpViewController) {
        print("User dismissed sign up.")
    }
    

    // MARK: Actions
    
    @IBAction func simpleAction(sender: AnyObject){
        self.presentViewController(self.loginViewController, animated: true, completion: nil)
        
    }
    
    
}


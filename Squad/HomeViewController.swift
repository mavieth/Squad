//
//  HomeViewController.swift
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

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = PFUser.currentUser()?.username
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Parse Logout
    @IBAction func logoutLoggedInUser() {
        print("Logged in user \(PFUser.currentUser()?.username) is logging out.")
        let viewController = self.storyboard!.instantiateViewControllerWithIdentifier("Login") as UIViewController
        self.presentViewController(viewController, animated: true, completion: nil)
        PFUser.logOut()
    }
    
    
    
    
}
//
//  LoginViewController.swift
//  project-telephone
//
//  Created by James Kelleher on 3/9/16.
//  Copyright © 2016 Kelleher & Fam, LLC. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, FBSDKLoginButtonDelegate {

    @IBOutlet var btnFacebook: FBSDKLoginButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureFacebook()
        
//        while true {
//            print("butts")
//        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        
        let profileStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let profileView = profileStoryboard.instantiateViewControllerWithIdentifier("Profile")
        self.presentViewController(profileView, animated: true, completion: nil)
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        print("logged out")
    }
    
    func configureFacebook() {
        
        btnFacebook.readPermissions = ["public_profile", "email", "user_friends"]
        btnFacebook.delegate = self
        
    }
    
}

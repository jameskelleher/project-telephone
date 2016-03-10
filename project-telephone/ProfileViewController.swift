//
//  ProfileViewController.swift
//  project-telephone
//
//  Created by James Kelleher on 3/9/16.
//  Copyright © 2016 Kelleher & Fam, LLC. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var profileName: UILabel!
    @IBOutlet var btnFacebook: FBSDKLoginButton!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        configureFacebook()
        
        FBSDKGraphRequest.init(graphPath: "me", parameters: ["fields":"first_name, last_name, picture.type(large)"]).startWithCompletionHandler { (connection, result, error) -> Void in
            
            if (error != nil) {
                print(error)
            } else {
                let strFirstName: String = result.objectForKey("first_name") as! String
                let strLastName: String = result.objectForKey("last_name") as! String
                let strPictureURL: String = result.objectForKey("picture")!.objectForKey("data")!.objectForKey("url") as! String
                
                self.profileName.text = "Welcome, \(strFirstName) \(strLastName)"
                self.profileImage.image = UIImage(data: NSData(contentsOfURL: NSURL(string: strPictureURL)!)!)
            }
        }
    }
    
    func loginButton(loginButton: FBSDKLoginButton!, didCompleteWithResult result: FBSDKLoginManagerLoginResult!, error: NSError!) {
        //
    }
    
    func loginButtonDidLogOut(loginButton: FBSDKLoginButton!) {
        
        let loginManager: FBSDKLoginManager = FBSDKLoginManager()
        loginManager.logOut()
        
        let loginStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let loginView = loginStoryBoard.instantiateViewControllerWithIdentifier("Login")
        self.presentViewController(loginView, animated: true, completion: nil)
    }
    
    func configureFacebook() {
        
        btnFacebook.readPermissions = ["public_profile", "email", "user_friends"]
        btnFacebook.delegate = self
        
    }
}

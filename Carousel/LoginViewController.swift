//
//  LoginViewController.swift
//  Carousel
//
//  Created by Go, Ian on 9/29/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var signinScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var signinSpinner: UIActivityIndicatorView!
    
    var buttonInitialY: CGFloat!
    var buttonOffset: CGFloat!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        signinScrollView.delegate = self
        signinScrollView.contentSize = signinScrollView.frame.size
        signinScrollView.contentInset.bottom = 100
        
        buttonInitialY = buttonParentView.frame.origin.y
        buttonOffset = -140
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow , object: nil, queue: OperationQueue.main){(notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY + self.buttonOffset
            self.signinScrollView.contentOffset.y = self.signinScrollView.contentInset.bottom
        
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide , object: nil, queue: OperationQueue.main){(notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInitialY
            self.signinScrollView.contentOffset.y = self.signinScrollView.contentInset.bottom
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapBackSignin(_ sender: AnyObject) {
        self.navigationController!.popViewController(animated: true)
    }
    @IBAction func didTapScreen(_ sender: AnyObject) {
        view.endEditing(true)
    }
    @IBAction func didTapSignIn(_ sender: AnyObject) {
        if emailField.text!.isEmpty || passwordField.text!.isEmpty{
            showValidationAlert()
        }else{
            self.signinSpinner.startAnimating()
            delay(2){
                self.signinSpinner.stopAnimating()
                if self.emailField.text == "ianpgo@gmail.com" && self.passwordField.text == "password"{
                    self.performSegue(withIdentifier: "signinUserSegue", sender: nil)
                } else {
                    let alertController = UIAlertController(title: "Incorrect Credentials", message: "Please try again", preferredStyle: .alert)
                    
                    // create a cancel action
                    let cancelAction = UIAlertAction(title: "OK", style:.default) { (action) in
                        // handle cancel response here. Doing nothing will dismiss the view.
                    }
                    // add the cancel action to the alertController
                    alertController.addAction(cancelAction)
                    
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    func showValidationAlert(){
            //login error
            let alertController = UIAlertController(title: "Email & Password Required", message: "Please enter both your email and password", preferredStyle: .alert)
            
            // create a cancel action
            let cancelAction = UIAlertAction(title: "OK", style:.default) { (action) in
                // handle cancel response here. Doing nothing will dismiss the view.
            }
            // add the cancel action to the alertController
            alertController.addAction(cancelAction)
            
            present(alertController, animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

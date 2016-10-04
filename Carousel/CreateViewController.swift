//
//  CreateViewController.swift
//  Carousel
//
//  Created by Go, Ian on 10/3/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var checkBoxButton: UIButton!
    @IBOutlet weak var createScrollView: UIScrollView!
    @IBOutlet weak var buttonParentView: UIView!
    
    var buttonInititalY: CGFloat!
    var buttonOffset: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        createScrollView.delegate = self
        createScrollView.contentSize = createScrollView.frame.size
        createScrollView.contentInset.bottom = 100
        
        buttonInititalY = buttonParentView.frame.origin.y
        buttonOffset = -155
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow , object: nil, queue: OperationQueue.main){(notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInititalY + self.buttonOffset
            self.createScrollView.contentOffset.y = self.createScrollView.contentInset.bottom
            
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide , object: nil, queue: OperationQueue.main){(notification: Notification) in
            
            self.buttonParentView.frame.origin.y = self.buttonInititalY
            self.createScrollView.contentOffset.y = self.createScrollView.contentInset.bottom
            
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func didPressTermsBox(_ sender: AnyObject) {
        checkBoxButton.isSelected = !checkBoxButton.isSelected

    }
    @IBAction func didBackCreate(_ sender: AnyObject) {
            self.navigationController!.popViewController(animated: true)
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

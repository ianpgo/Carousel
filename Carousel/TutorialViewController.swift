//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Go, Ian on 9/29/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var takeSpinButton: UIButton!
    @IBOutlet weak var tutorialScrollView: UIScrollView!
    
    @IBOutlet weak var scrollPageControl: UIPageControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        tutorialScrollView.delegate = self
        tutorialScrollView.contentSize = CGSize(width: 1500, height: 667)
        
        takeSpinButton.alpha = 0

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        // Get the current page based on the scroll offset
        var page : Int = Int(round(scrollView.contentOffset.x / 375))
        
        // Set the current page, so the dots will update
        scrollPageControl.currentPage = page
        
        if page == 3{
            scrollPageControl.isHidden = true
            takeSpinButton.alpha = 1
        }
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

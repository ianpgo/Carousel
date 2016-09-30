//
//  IntroViewController.swift
//  Carousel
//
//  Created by Go, Ian on 9/29/16.
//  Copyright © 2016 Go, Ian. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var introImageView: UIImageView!
    @IBOutlet weak var introScrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introScrollView.contentSize = introImageView.frame.size
        introScrollView.delegate = self
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        <#code#>
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

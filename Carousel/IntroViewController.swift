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
    
    @IBOutlet weak var tile1View: UIImageView!
    @IBOutlet weak var tile2View: UIImageView!
    @IBOutlet weak var tile3View: UIImageView!
    @IBOutlet weak var tile4View: UIImageView!
    @IBOutlet weak var tile5View: UIImageView!
    @IBOutlet weak var tile6View: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        introScrollView.contentSize = introImageView.frame.size
        introScrollView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        animateTile(tileView: tile1View, yOffset: -335, xOffset: -30, scaleRatio: 1, rotationOffset: -10)
        animateTile(tileView: tile2View, yOffset: -295, xOffset: 75, scaleRatio: 1.65, rotationOffset: -10)
        animateTile(tileView: tile3View, yOffset: -475, xOffset: -66, scaleRatio: 1.7, rotationOffset: 10)
        animateTile(tileView: tile4View, yOffset: -458, xOffset: 10, scaleRatio: 1.6, rotationOffset: 10)
        animateTile(tileView: tile5View, yOffset: -550, xOffset: -230, scaleRatio: 1.65, rotationOffset: 10)
        animateTile(tileView: tile6View, yOffset: -550, xOffset: -15, scaleRatio: 1.65, rotationOffset: -10)
    }
    
    func animateTile( tileView: UIImageView, yOffset: CGFloat, xOffset: CGFloat, scaleRatio: CGFloat, rotationOffset: CGFloat){
        
        let offset = CGFloat(introScrollView.contentOffset.y)
        
        let tx = convertValue(offset, r1Min: 0, r1Max: 667, r2Min: xOffset, r2Max: 0)
        let ty = convertValue(offset, r1Min: 0, r1Max: 667, r2Min: yOffset, r2Max: 0)
        let scale = convertValue(offset, r1Min: 0, r1Max: 667, r2Min: scaleRatio, r2Max: 1)
        let rotation = convertValue(offset, r1Min: 0, r1Max: 667, r2Min: rotationOffset, r2Max: 0)
        
        let tileScale = CGAffineTransform(scaleX: scale, y: scale)
        let tileTranslate = CGAffineTransform(translationX: tx,y: ty)
        let tileRotate = CGAffineTransform(rotationAngle: CGFloat(Double(rotation) * M_PI / 180))
        
        tileView.transform = tileScale.concatenating(tileTranslate).concatenating(tileRotate)
        
    }
}

//
//  ViewController.swift
//  fbLiveStreamAnimation
//
//  Created by Sudhanshu Sudhanshu on 4/20/18.
//  Copyright © 2018 Sudhanshu. All rights reserved.
//

import UIKit

let instagramLive = true
class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapGestureHandler))
        view.addGestureRecognizer(tapGesture)
    }
    
    func generateAnimatedViews () {
        let someRandomNumber = Int(2 + drand48() * 20)
        let dimension = 20 + drand48() * 10
        let duration = 2 + drand48() * 3

        if instagramLive == true {
            let thumbsUpImageView = ((someRandomNumber % 2) == 0) ? UIImageView(image: #imageLiteral(resourceName: "heart")) : UIImageView(image: #imageLiteral(resourceName: "thumbs_up"))

            thumbsUpImageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)

            let animation = CAKeyframeAnimation(keyPath: "position")
            
            animation.duration = duration
            animation.fillMode = kCAFillModeForwards

            animation.path = customPath().cgPath
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            animation.isRemovedOnCompletion = true
            
            thumbsUpImageView.layer.add(animation, forKey: nil)
            
            view.addSubview(thumbsUpImageView)

        }else {
            
            let thumbsUpImageView = ((someRandomNumber % 2) == 0) ? UIImageView(image: #imageLiteral(resourceName: "heart")) : UIImageView(image: #imageLiteral(resourceName: "thumbs_up"))
            
            thumbsUpImageView.frame = CGRect(x: 0, y: 0, width: dimension, height: dimension)
            
            let animation = CAKeyframeAnimation(keyPath: "position")
            animation.path = customPath().cgPath
            animation.duration = duration
            animation.fillMode = kCAFillModeForwards
            animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
            animation.isRemovedOnCompletion = false
            
            thumbsUpImageView.layer.add(animation, forKey: nil)
            view.addSubview(thumbsUpImageView)
        }
    }
    
    @objc func tapGestureHandler () {
        (0...10).forEach { (_) in
            generateAnimatedViews()
        }
    }
}

func customPath () -> UIBezierPath {
    let path  = UIBezierPath()
    if instagramLive == true{
        
        let animattionFrameHeight: CGFloat = 200
        
        path.move(to: CGPoint(x: UIScreen.main.bounds.width - 44, y: UIScreen.main.bounds.height - 44))
        
        let endPoint = CGPoint(x: UIScreen.main.bounds.width - 44 - CGFloat(drand48() * 10 - 30), y: UIScreen.main.bounds.height - 44 - animattionFrameHeight)
        
        let randomXShift: CGFloat = CGFloat(10 + drand48() * 50)
        
        let cp1 = CGPoint(x: UIScreen.main.bounds.width - 44 - randomXShift, y: UIScreen.main.bounds.height - 44 - 50)
        let cp2 = CGPoint(x: UIScreen.main.bounds.width - 44 + randomXShift, y: UIScreen.main.bounds.height - 44 - 150)
        
        
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    }else {
        path.move(to: CGPoint(x: 0, y: 200))
        
        let endPoint = CGPoint(x: UIScreen.main.bounds.width + 30, y: 200)
        
        let randomYShift: CGFloat = CGFloat(100 + drand48() * 100)
        
        let cp1 = CGPoint(x: 100, y: 100 - randomYShift)
        let cp2 = CGPoint(x: 200, y: 300 + randomYShift)
        path.addCurve(to: endPoint, controlPoint1: cp1, controlPoint2: cp2)
    }
    
    return path
}

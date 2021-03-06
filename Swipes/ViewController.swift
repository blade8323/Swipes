//
//  ViewController.swift
//  Swipes
//
//  Created by Владислав Соколов on 07.09.2020.
//  Copyright © 2020 Владислав Соколов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
//    private var gestureStartPoint: CGPoint!
//    private static let minimumGestureLength = Float(25.0)
//    private static let maximumVariance = Float(5.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let vertical = UISwipeGestureRecognizer(target: self, action: #selector(reportVerticalSwipe(_: )))
        vertical.direction = [.up, .down]
        view.addGestureRecognizer(vertical)
        
        let horizontal = UISwipeGestureRecognizer(target: self, action: #selector(reportHorizontalSwipe(_: )))
        horizontal.direction = [.left, .right]
        view.addGestureRecognizer(horizontal)
    }

//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first {
//            gestureStartPoint = touch.location(in: self.view)
//        }
//    }
//
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        if let touch = touches.first, let gestureStartPoint = self.gestureStartPoint {
//            let currentPosition = touch.location(in: self.view)
//            let deltaX = fabsf(Float(gestureStartPoint.x - currentPosition.x))
//            let deltaY = fabsf(Float(gestureStartPoint.y - currentPosition.y))
//            if deltaX >= ViewController.minimumGestureLength && deltaY <= ViewController.maximumVariance {
//                label.text = "Horizontal swipe detected"
//                DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
//                    self.label.text = ""
//                }
//            } else if deltaY >= ViewController.minimumGestureLength && deltaX <= ViewController.maximumVariance {
//                label.text = "Vertical swipe detected"
//                DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
//                    self.label.text = ""
//                }
//            }
//        }
//    }

    @objc func reportHorizontalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
    @objc func reportVerticalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
}


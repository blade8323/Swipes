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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for touchCount in 0..<5 {
            let vertical = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportVerticalSwipe(_:)))
            vertical.direction = [.up, .down]
            vertical.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(vertical)

            let horisontal = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.reportHorizontalSwipe(_:)))
            horisontal.direction = [.left, .right]
            horisontal.numberOfTouchesRequired = touchCount
            view.addGestureRecognizer(horisontal)
        }
    }

    func descriptionFortouchCount(_ touchCount: Int) -> String {
        switch touchCount {
        case 1:
            return "Single"
        case 2:
            return "Double"
        case 3:
            return "Triple"
        case 4:
            return "Quadruple"
        case 5:
            return "Quintuple"
        default:
            return ""
        }
    }

    @objc func reportHorizontalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Horizontal swipe detected"
        let count = descriptionFortouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger horizontal swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
    @objc func reportVerticalSwipe(_ recognizer: UIGestureRecognizer) {
        label.text = "Vertical swipe detected"
        let count = descriptionFortouchCount(recognizer.numberOfTouches)
        label.text = "\(count)-finger vertical swipe detected"
        DispatchQueue.main.asyncAfter(deadline: .now() + Double(Int64(2 * NSEC_PER_SEC)) / Double(NSEC_PER_SEC)) {
            self.label.text = ""
        }
    }
    
}


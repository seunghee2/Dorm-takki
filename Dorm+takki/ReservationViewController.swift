//
//  ReservationViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class ReservationViewController: UIViewController {

    @IBOutlet weak var timerView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "RESERVATIONS"
        self.addCircleView(self.timerView, isForeground: false, duration: 0.0, fromValue: 0.0, toValue: 1.0)
        self.initializeCircle()
    }
    
    func initializeCircle() {
        self.addCircleView(self.timerView, isForeground: true, duration: 0.5, fromValue: 0.0, toValue: 0.3)
    }
    
    func addCircleView(_ myView: UIView, isForeground: Bool, duration: TimeInterval, fromValue: CGFloat, toValue: CGFloat) {
        let circleView = CircleView(frame: CGRect(x: 0, y: 0, width: self.timerView.frame.size.width, height: self.timerView.frame.size.height))
        
        if (isForeground == true) {
            circleView.setStrokeColor(UIColor.init(red: 220/255.0, green: 220/255.0, blue: 220/255.0, alpha: 1).cgColor)
            
        } else {
            circleView.setStrokeColor(UIColor.init(red: 255/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.8).cgColor)
        }
        
        myView.addSubview(circleView)
        circleView.transform = CGAffineTransform(rotationAngle: -1.56)
        circleView.animateCircleTo(duration, fromValue: fromValue, toValue: toValue)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

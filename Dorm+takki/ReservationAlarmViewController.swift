//
//  ReservationAlarmViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 18/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class ReservationAlarmViewController: UIViewController {
    @IBOutlet weak var messageLabel: UILabel!

    @IBOutlet weak var contentView: UIView!
    var type: String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initLabel()
        self.showAnimate()
    }
    
    func initWithType(type: String) {
        self.type = type
    }

    @IBAction func closeView(_ sender: Any) {
        self.removeAnimate()
    }
    
    func initLabel() {
        if self.messageLabel != nil {
            self.messageLabel.text = self.type
        }
    }
    
    @IBAction func closePopOverView(_ sender: Any) {
        self.removeAnimate()
    }
    
    func showAnimate() {
        self.contentView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.contentView.alpha = 0.0
        UIView.animate(withDuration: 0.25, animations: {
            self.contentView.alpha = 1.0
            self.contentView.transform = CGAffineTransform(scaleX:1.0, y:1.0)
        })
    }
    
    func removeAnimate() {
        UIView.animate(withDuration: 0.25, animations: {
            self.contentView.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.contentView.alpha = 0.0
        }, completion: { (finished : Bool) in
            if (finished) {
                self.view.removeFromSuperview()
            }
            
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}

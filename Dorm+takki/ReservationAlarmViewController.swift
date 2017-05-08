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
    @IBOutlet weak var confirmButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var contentView: UIView!
    
    var type: String = ""
    var number: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.5)
        self.contentView.layer.cornerRadius = 10
        self.initLabel()
        self.showAnimate()
    }
    
    func initWithType(type: String, number: String) {
        self.type = type
        self.number = number
    }

    @IBAction func closeView(_ sender: Any) {
        self.removeAnimate()
    }
    
    func initLabel() {
        if self.messageLabel != nil {
            if self.type == "on" {
                self.messageLabel.text = self.number + "번째 세탁기가 현재 동작 중입니다. \n예약하시겠습니까?"
                self.confirmButton.setTitle("예약하기", for: UIControlState.normal)
                self.confirmButton.addTarget(self, action: #selector(reserveAlarm(_:)), for: .touchUpInside)
            } else {
                self.messageLabel.text = self.number + "번째 세탁기가 현재 사용 가능합니다."
                self.cancelButton.isHidden = true
                self.confirmButton.addTarget(self, action: #selector(closePopOverView(_:)), for: .touchUpInside)
            }
        }
    }
    
    @IBAction func closePopOverView(_ sender: Any) {
        self.removeAnimate()
    }
    
    @IBAction func reserveAlarm(_ sender: Any) {
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

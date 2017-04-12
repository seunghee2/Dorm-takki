//
//  ReservationAlarmView.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class ReservationAlarmView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        Bundle.main.loadNibNamed("ReservationAlarmView", owner: self, options: nil)
        self.addSubview(self)
        
    }
    
    // for this to work programmatically I had to do the same...
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("ReservationAlarmView", owner: self, options: nil)
        self.addSubview(self)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = UIColor.init(red: 0/255.0, green: 0/255.0, blue: 0/255.0, alpha: 0.6)
    }

    
    func showInView(superView:UIView, messages:String) {
        superView.addSubview(self)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

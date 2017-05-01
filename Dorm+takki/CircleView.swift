//
//  CircleView.swift
//  Dorm+takki
//
//  Created by 이승희 on 01/05/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class CircleView: UIView {
    
    var circleLayer: CAShapeLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.clear
        
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: frame.size.width / 2.0, y: frame.size.height / 2.0), radius: (frame.size.width - 10) / 2, startAngle: 0.0, endAngle: CGFloat(M_PI * 2.0), clockwise: true)
        circleLayer = CAShapeLayer()
        circleLayer.path = circlePath.cgPath
        circleLayer.fillColor = UIColor.clear.cgColor
        
        circleLayer.strokeColor = UIColor.red.cgColor
        circleLayer.lineWidth = 20.0
        circleLayer.strokeEnd = 0.0
        
        layer.addSublayer(circleLayer)
        
     }
    
    func setStrokeColor(_ color: CGColor) {
        circleLayer.strokeColor = color
    }
    
    func animateCircle(_ duration: TimeInterval) {
        animateCircleTo(duration, fromValue: 0.0, toValue: 1.0)
    }
    
    func animateCircleTo(_ duration: TimeInterval, fromValue: CGFloat, toValue: CGFloat) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.duration = duration
        animation.fromValue = 0
        animation.toValue = toValue
        
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseOut)
        
        circleLayer.strokeEnd = toValue
        circleLayer.add(animation, forKey: "animateCircle")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}

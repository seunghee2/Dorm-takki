//
//  HomeViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    let array = [0, 0, 1, 0, 1, 0, 0, 0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DORMTAKKI"
        //self.performSegue(withIdentifier: "LogIn", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func reserveAlarm(_ sender: UIButton) {
        let popOver = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ReservationAlarm") as! ReservationAlarmViewController
        
        if self.array[sender.tag] == 0 {
            popOver.initWithType(type: "off", number: "\(sender.tag + 1)")
        } else {
            popOver.initWithType(type: "on", number: "\(sender.tag + 1)")
        }
        
        self.addChildViewController(popOver)
        popOver.view.frame = self.view.frame
        self.view.addSubview(popOver.view)
        popOver.didMove(toParentViewController: self)
    }
}

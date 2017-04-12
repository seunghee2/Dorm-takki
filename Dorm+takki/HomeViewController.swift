//
//  HomeViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DORMTAKKI"
        self.performSegue(withIdentifier: "LogIn", sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reserveAlarm(_ sender: UIButton) {

        let reserveView = ReservationAlarmView(frame: self.view.frame)
        if sender.tag < 10 {
            
        } else {
            
        }
        
        reserveView.showInView(superView: self.view, messages: "")
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

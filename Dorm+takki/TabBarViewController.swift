//
//  TabBarViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 01/05/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       /*
        if viewController == self.viewControllers![3]{
            let alert = UIAlertController(title: "알림", message: "예약 내역이 존재하지 않습니다.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        */
        return true
    }

}

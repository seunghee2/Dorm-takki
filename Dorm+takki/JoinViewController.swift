//
//  JoinViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class JoinViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func backButton(_ sender: Any) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func signUpDone(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: false, completion: nil)
    }
}

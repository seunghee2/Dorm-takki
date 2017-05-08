//
//  MyPageViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var sections = [String]()
    var titleForSection1 = [String]()
    var titleForSection2 = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.sections = ["설정", "기타"]
        self.titleForSection1 = ["개인정보 설정", "알림 설정"]
        self.titleForSection2 = ["버그리포트", "개발자정보"]
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.navigationItem.title = "MY PAGE"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 45
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return titleForSection1.count
        } else {
            return titleForSection2.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        if indexPath.section == 0 {
            cell.textLabel?.text = self.titleForSection1[indexPath.row]
        } else {
            cell.textLabel?.text = self.titleForSection2[indexPath.row]
        }
        return cell
    }
                
                
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

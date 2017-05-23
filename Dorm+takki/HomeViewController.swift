//
//  HomeViewController.swift
//  Dorm+takki
//
//  Created by 이승희 on 12/04/2017.
//  Copyright © 2017 이승희. All rights reserved.
//

import UIKit
import AZSClient


class HomeViewController: UIViewController {

    let array = [0, 0, 1, 0, 1, 0, 0, 0]
    
    // if using a SAS token, fill it in here. If using Shared key access, comment out the following line
    //var containerURL = ""
    //var usingSAS = true
    
    
    // if using shared key access, fill in your credential here and un-comment the 'UsingSAS' line:
    var connectionString = "DefaultEndpointsProtocol=https;AccountName=dormstorage;AccountKey=6aATMMJD6zS+fzO6dTFFndkGG8mOVRm6MVZmNEioUZHE13b0cSkUGWrKkaUQ7b5JjYiibNv5clvB8a1D7ihmGA==;EndpointSuffix=core.windows.net"
    var containerName = "mycontainer"
    // var usingSAS = false
    
    var blobs = [AZSCloudBlob]()
    var container: AZSCloudBlobContainer
    var continuationToken: AZSContinuationToken?
    
    required init?(coder aDecoder: NSCoder) {
        let storageAccount: AZSCloudStorageAccount
        try! storageAccount = AZSCloudStorageAccount(fromConnectionString: connectionString)
        let blobClient = storageAccount.getBlobClient()
        self.container = blobClient.containerReference(fromName: containerName)
        
        let condition = NSCondition()
        var containerCreated = false
        
        self.container.createContainerIfNotExists { (error : Error?, created) -> Void in
            condition.lock()
            containerCreated = true
            condition.signal()
            condition.unlock()
        }
        
        condition.lock()
        while (!containerCreated) {
            condition.wait()
        }
        condition.unlock()
        
        
        self.continuationToken = nil
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "DORMTAKKI"
        
        self.reloadBlobList()
        
        //self.performSegue(withIdentifier: "LogIn", sender: nil)
    }
    
    func reloadBlobList() {
        container.listBlobsSegmented(with: nil, prefix: nil, useFlatBlobListing: true, blobListingDetails: AZSBlobListingDetails(), maxResults: 50) { (error : Error?, results : AZSBlobResultSegment?) -> Void in
            
            self.blobs = [AZSCloudBlob]()
            
            for blob in results!.blobs! {
                self.blobs.append(blob as! AZSCloudBlob)
                
            }
            
            self.continuationToken = results!.continuationToken
            self.parseBlobs()
            //self.tableView.performSelector(onMainThread: #selector(UICollectionView.reloadData), with: nil, waitUntilDone: false)
        }
    }

    func parseBlobs() {
        for blob in self.blobs {
            blob.downloadToText(completionHandler: { (error : Error?, blobText : String?) -> Void in
                print(blobText as Any)
                // self.performSelector(onMainThread: #selector(GetBlobViewController.setBlobText(_:)), with: blobText, waitUntilDone: false)
            })
            //print(blob.blobName)
        }
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

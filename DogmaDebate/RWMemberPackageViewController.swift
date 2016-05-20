//
//  RWMemberPackageViewController.swift
//  DogmaDebate
//
//  Created by Rondale Williams on 5/20/16.
//  Copyright © 2016 RondaleWilliams. All rights reserved.
//

import Foundation

class RWMemberPackageViewController : UIViewController {
    
    let headers =  ["Premier Membership", "Plus Membership", "Premium Membership"]
    let premierOptions = ["Chat w/ Hosts During Live Shows", "Private Facebook Group Access", "Stream Content to Smartphone", "Unedited Interviews", "Reason Egg Song Downloads", "Extended Show Audio", "Download New Shows w/ No Commercials"]
    let plusOptions = ["Science Videos", "Archived Studio Videos", "Live Studio Webcam", "Chat w/ Hosts During Live Shows", "Private Facebook Group Access", "Stream Content to Smartphone", "Unedited Interviews", "Reason Egg Song Downloads", "Extended Show Audio", "Download New Shows w/ No Commercials"]
    
    let premiumOptions = ["10% Goes to IAm4th Fund", "Your Name Mentioned On Air", "Behind-the-Scenes Videos", "Science Videos", "Archived Studio Videos", "Live Studio Webcam", "Chat w/ Hosts During Live Shows", "Private Facebook Group Access", "Stream Content to Smartphone", "Unedited Interviews", "Reason Egg Song Downloads", "Extended Show Audio", "Download New Shows w/ No Commercials"]

    
    
    @IBOutlet weak var tableView: UITableView!
    
    static func memberPackageViewController() -> RWMemberPackageViewController {
        let vc = UIStoryboard(name: "RWMemberPackageViewController", bundle: nil).instantiateInitialViewController() as! RWMemberPackageViewController
        return vc
    }
    
    override func viewDidLoad() {
        tableView.registerNib(UINib(nibName: "RWMoreTableViewCell", bundle: nil), forCellReuseIdentifier: "RWMoreTableViewCell")
    }
}

extension RWMemberPackageViewController: UITableViewDataSource {
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return headers.count
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var rows = 0
        switch section {
        case 0:
            rows = premierOptions.count
        case 1:
            rows =  plusOptions.count
        case 2:
            rows = premiumOptions.count
        default:
            rows = 0
        }
        
        return rows
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = headers[section]
        
        return title
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let moreTableViewCell = tableView.dequeueReusableCellWithIdentifier("RWMoreTableViewCell", forIndexPath: indexPath)
        switch indexPath.section {
        case 0:
            moreTableViewCell.textLabel?.text = premierOptions[indexPath.row]
        case 1:
            moreTableViewCell.textLabel?.text = plusOptions[indexPath.row]
        case 2:
            moreTableViewCell.textLabel?.text = premiumOptions[indexPath.row]
        default:
            moreTableViewCell.textLabel?.text = ""
        }

        
        return moreTableViewCell
    }
    
}


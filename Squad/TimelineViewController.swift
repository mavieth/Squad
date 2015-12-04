//
//  TimelineViewController.swift
//  Squad
//
//  Created by Michael Vieth on 12/3/15.
//  Copyright © 2015 Michael Vieth. All rights reserved.
//

import Foundation
import UIKit
import Parse
import ParseUI


class TimelineViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let kCellIdentifier = "Cell"
    let query = PFQuery(className: "messages")
    
    
    // TimelineContent Struct
    struct TimelineContent {
        var username: String
        var text: String
    }
    
    // removed private
    var contents: [TimelineContent] = []
    
    // Add Parse Data
    func getTimelineContents(){
        let query = PFQuery(className: "Users")
        let uname = "Michael"
        let email = "mavieth@gmail.com"
        print(query)
        contents.append(TimelineContent(username: uname, text: email))
    }
    


    let curUser = PFUser.currentUser()
    
//    func getUsers(curUser : PFUser) -> (username: String, text: String) {
//        let username = "Patricia"
//        let text = "IsCool"
//        return (username, text)
//    }
    
    var userArray:NSMutableArray = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getTimelineContents()
        print(contents)
        // Do any additional setup after loading the view.
        title = "Timeline"
        let nib = UINib(nibName: "TimelineViewCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: kCellIdentifier)
        tableView.separatorInset = UIEdgeInsetsZero
        tableView.layoutMargins = UIEdgeInsetsZero
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func segueBack(segue: UIStoryboardSegue) {}
}

extension TimelineViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(kCellIdentifier)!
        
        if let cell = cell as? TimelineViewCell {
            let num = indexPath.row % 5 + 1
            
            if let image = UIImage(named: "squirrel") {
                cell.setIconImage(image)
            }
            
            let content = contents[indexPath.row]
            cell.setUsername(content.username)
            cell.setMainText(content.text)
        }
        
        cell.layoutMargins = UIEdgeInsetsZero
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contents.count
    }
}

extension TimelineViewController: UITableViewDelegate {
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100
    }
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let viewController = storyboard.instantiateViewControllerWithIdentifier("DetailViewController") as? DetailViewController {
            if let cell = tableView.cellForRowAtIndexPath(indexPath) as? TimelineViewCell {
                viewController.iconImage = cell.iconImageView?.image
            }
            
            let content = contents[indexPath.row]
            viewController.username = content.username
            viewController.text = content.text
            navigationController?.pushViewController(viewController, animated: true)
        }
    }
}
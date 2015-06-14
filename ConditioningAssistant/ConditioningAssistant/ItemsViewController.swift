//
//  ItemsViewController.swift
//  ConditioningAssistant
//
//  Created by Q on 15/6/13.
//  Copyright (c) 2015年 zwq. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var isFold = [true, true]
    let sectionTitleArr = ["Section 1", "Section 2"]
    let sectionListArr = [["New Zealand","Australia","Bangladesh","Sri Lanka"], ["India","South Africa","UAE","Pakistan"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "All Items"
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }


    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        println("numberOfSections")
        return sectionTitleArr.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("numberOfRows In section")
        if (isFold[section] == false) {
            return sectionListArr[section].count
        }
        
        return 0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! UITableViewCell
        
        if !isFold[indexPath.section] {
            cell.textLabel?.text = sectionListArr[indexPath.section][indexPath.row]
            cell.backgroundColor = UIColor.greenColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArr[section]
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 50.0))
        headerView.backgroundColor = UIColor.blueColor()
        let headerString = UILabel(frame: CGRect(x: 10, y: 10, width: tableView.frame.size.width-10, height: 30)) as UILabel
        headerString.text = sectionTitleArr[section]
        headerView .addSubview(headerString)
        return headerView
    }
    
    override func tableView(tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tag = section
        println(view.tag)
        let headerTapped = UITapGestureRecognizer(target: self, action: "sectionHeaderTapped:")
        view.addGestureRecognizer(headerTapped)

    }
    
    func sectionHeaderTapped(recognizer: UITapGestureRecognizer) {
        println("Tapping working")
        println(recognizer.view?.tag)
        
        let tappedSection = recognizer.view?.tag as Int!
        isFold[tappedSection] = !isFold[tappedSection]
        var sectionToReload = NSIndexSet(index: tappedSection)
        self.tableView.reloadSections(sectionToReload, withRowAnimation: UITableViewRowAnimation.Fade)
    }
    
}

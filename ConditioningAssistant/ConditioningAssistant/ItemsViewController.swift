//
//  ItemsViewController.swift
//  ConditioningAssistant
//
//  Created by Q on 15/6/13.
//  Copyright (c) 2015年 zwq. All rights reserved.
//

import UIKit

class ItemsViewController: UITableViewController {
    
    var isFold = [false, false]
    let sectionTitleArr = ["Group 1", "Group 2"]
    let sectionListArr = [["胸部", "肩部", "手臂", "腹部"], ["腿部", "背部", "手臂", "腹部"]]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "项目清单"
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
        
        cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        
        if !isFold[indexPath.section] {
            cell.textLabel?.text = sectionListArr[indexPath.section][indexPath.row]
            cell.backgroundColor = UIColor.lightGrayColor()
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        if (cell?.accessoryType == UITableViewCellAccessoryType.Checkmark) {
            cell?.accessoryType = UITableViewCellAccessoryType.None
        } else {
            cell?.accessoryType = UITableViewCellAccessoryType.Checkmark
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArr[section]
    }
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRectMake(0.0, 0.0, tableView.frame.size.width, 50.0))
        headerView.backgroundColor = UIColor.grayColor()
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

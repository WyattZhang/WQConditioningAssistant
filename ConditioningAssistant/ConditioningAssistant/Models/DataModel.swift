//
//  DataModel.swift
//  ConditioningAssistant
//
//  Created by Q on 15/6/16.
//  Copyright (c) 2015年 zwq. All rights reserved.
//

import Foundation

class DataModel {
    
    func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true) as! [String]
        return paths[0]
    }
    
    func dataFilePath() -> String {
        return documentsDirectory().stringByAppendingPathComponent("Data.plist")
    }
    
    func saveData() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
        
    }
}

//
//  RoomTableViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class RoomTableViewController: UITableViewController {
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 9
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("roomCell", forIndexPath: indexPath) as! RoomTableViewCell
        
        
        //Date Simulation
        let formater = NSDateFormatter()
        formater.dateFormat = "MM/dd/yyyy"
        let date = NSDate(timeIntervalSinceNow: Double(indexPath.row * 1000000))
        cell.productIdLabel.text = "\( 31245 + Int(arc4random()) % 10)"
        cell.expirationDateLabel.text = "\(formater.stringFromDate(date) )"

        return cell
    }
    
}

//
//  QiaCubeTableViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class QiaCubeTableViewController: UITableViewController {

    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 7
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cubeCell", forIndexPath: indexPath) as! CubeTableViewCell
        cell.locationLabel.text = "Room"
        cell.amountLabel.text = "\(indexPath.row)"
        return cell
    }
}

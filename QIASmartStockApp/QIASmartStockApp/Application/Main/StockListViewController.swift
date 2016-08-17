//
//  StockListViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class StockListViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - UITableViewDataSource, UITableViewDelegate
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let cell = tableView.dequeueReusableCellWithIdentifier("stockCell", forIndexPath: indexPath)
        cell.textLabel?.text = "Row number \(indexPath.row)"
        return cell
    }
    
}

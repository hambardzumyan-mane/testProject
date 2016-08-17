//
//  CheckInOutViewController.swift
//  QIA Smart Stock App
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//
import UIKit

class CheckInOutViewController: UIViewController {

    @IBOutlet private weak var searchLabel: UILabel!
    @IBOutlet private weak var searchBar: UISearchBar!

    
	internal var status = CheckInOutStatus.None

	enum CheckInOutStatus: Int {
		case None = 0
		case CheckOut = 1
		case CheckIn = 2
	}

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
        
        switch self.status {
        case .CheckIn:
            NSLog("Check in ...")
            
            self.searchLabel.text = "Search by serial number"
            self.searchBar.placeholder = "42B38"
        case .CheckOut:
            NSLog("Check out ...")
            
            self.searchLabel.text = "Search by product name or catalog number"
            self.searchBar.placeholder = "QIA CUBE...."
        default:
            NSLog("Not check ...")
        }
    }
}

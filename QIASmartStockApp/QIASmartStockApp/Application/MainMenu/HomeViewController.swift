//
//  ViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // wher is privat
	@IBOutlet var stockList: UIButton!
	@IBOutlet var checkOut: UIButton!
	@IBOutlet var manageStock: UIButton!

	override func viewDidLoad() {
		super.viewDidLoad()

		let arrayOfButtons: Array<UIButton> = [self.stockList, self.checkOut, self.manageStock]

		for button in arrayOfButtons {
            // Use generic func
			button.backgroundColor = UIColor.whiteColor()
			button.layer.shadowColor = UIColor.blackColor().CGColor
			button.layer.shadowOffset = CGSizeMake(2, 2)
			button.layer.masksToBounds = false
			button.layer.shadowRadius = 1
			button.layer.shadowOpacity = 1
		}

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	// MARK: - Navigation

	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
		let viewControler = segue.destinationViewController
        // Optemize the code
		if segue.identifier == "checkInSegue" {
			let checkInOutViewController = viewControler as! CheckInOutViewController
			checkInOutViewController.status = .CheckIn
		}
		if segue.identifier == "checkOutSegue" {
			let checkInOutViewController = viewControler as! CheckInOutViewController
			checkInOutViewController.status = .CheckOut
		}
	}

}

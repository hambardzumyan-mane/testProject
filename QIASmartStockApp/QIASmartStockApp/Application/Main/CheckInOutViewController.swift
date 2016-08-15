//
//  CheckInOutViewController.swift
//  QIA Smart Stock App
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//
import UIKit

class CheckInOutViewController: UIViewController {

	internal var status = CheckInOutStatus.None

	enum CheckInOutStatus: Int {
		case None = 0
		case CheckOut = 1
		case CheckIn = 2
	}

	override func viewDidLoad() {
		if self.status == .CheckIn {
			NSLog("Check in..")
		}

		if self.status == .CheckOut {
			NSLog("Check out..")
		}
	}
}

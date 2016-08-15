//
//  ViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/11/16.
//  Copyright © 2016 Qiagen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var containerView: UIView!
	override func viewDidLoad() {
		super.viewDidLoad()

		let leftButton = UIBarButtonItem.itemWith(UIImage(named: "MenuIcon"), target: self, action: #selector(openLeftMenu))
		self.navigationItem.leftBarButtonItem = leftButton
		self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	func openLeftMenu() {
		self.getEasySlide().openMenu(.LeftMenu, animated: true, completion: { })
	}

	private func getEasySlide() -> ESNavigationController {
		return self.navigationController as! ESNavigationController
	}

}

extension UIBarButtonItem {
	class func itemWith(colorfulImage: UIImage?, target: AnyObject, action: Selector) -> UIBarButtonItem {
		let button = UIButton(type: .Custom)
		button.setImage(colorfulImage, forState: .Normal)
		button.frame = CGRectMake(0, 0, 44.0, 44.0)
		button.addTarget(target, action: action, forControlEvents: .TouchUpInside)

		let barButtonItem = UIBarButtonItem(customView: button)
		return barButtonItem
	}
}
//
//  CustomNavigationController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class CustomNavigationController: ESNavigationController {

	override func viewDidLoad() {

		super.viewDidLoad()

		let viewController = self.storyboard?.instantiateViewControllerWithIdentifier(String(LeftMenuViewController))
		self.setupMenuViewController(.LeftMenu, viewController: viewController!)
		if var delegate: MenuDelegate = viewController! as? MenuDelegate {
			delegate.easySlideNavigationController = self
		}
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
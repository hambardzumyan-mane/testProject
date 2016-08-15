//
//  CustomNavigationController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/11/16.
//  Copyright © 2016 Qiagen. All rights reserved.
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

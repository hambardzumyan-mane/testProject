//
//  LeftMenuViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/11/16.
//  Copyright © 2016 Qiagen. All rights reserved.
//

import UIKit

class LeftMenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, MenuDelegate {

	@IBOutlet private weak var tableView: UITableView!

	private let menuItems = ["Home", "Settings", "Reports", "Stock info"]
//	private var menuViewControllers: [UIViewController] = []

	var easySlideNavigationController: ESNavigationController?

	override func viewDidLoad() {
		super.viewDidLoad()
		self.tableView.dataSource = self
		self.tableView.delegate = self

		// load menu view controllers
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		for menuItem in menuItems {
//			let viewController = storyboard.instantiateViewControllerWithIdentifier("\(menuItem)ViewController")
//			self.menuViewControllers.append(viewController)
//		}
	}

	// MARK: - UITableViewDataSource, UITableViewDelegate

	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return self.menuItems.count
	}

	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		let cell = tableView.dequeueReusableCellWithIdentifier(MenuTableViewCell.CELL_ID, forIndexPath: indexPath)
		let title = menuItems[indexPath.row]
		cell.textLabel?.text = title
		cell.imageView!.image = UIImage(named: "\(title)Icon")!
		return cell
	}

	func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {

		tableView.deselectRowAtIndexPath(indexPath, animated: true)

		let storyboard = UIStoryboard(name: "Main", bundle: nil)

		// get the new view controller
		let viewController = storyboard.instantiateViewControllerWithIdentifier("\(menuItems[indexPath.row])ViewController")

		// present next view
		if let slideController = self.easySlideNavigationController {
			slideController.setBodyViewController(viewController, closeOpenMenu: true, ignoreClassMatch: true)
		}

	}
}
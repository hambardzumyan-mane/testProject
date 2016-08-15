//
//  ViewController.swift
//  QIA Smart Stock App
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

	@IBOutlet private weak var signIn: UIButton!
	@IBOutlet private weak var email: UITextField!
	@IBOutlet private weak var password: UITextField!

//	private var validation: Validation?
	private var validation = Validation.sharedInstance

	override func viewDidLoad() {
		super.viewDidLoad()

		self.hideKeyboard()

		self.signIn.backgroundColor = UIColor.whiteColor()
		self.signIn.layer.shadowColor = UIColor.blackColor().CGColor
		self.signIn.layer.shadowOffset = CGSizeMake(2, 2)
		self.signIn.layer.masksToBounds = false
		self.signIn.layer.shadowRadius = 1
		self.signIn.layer.shadowOpacity = 1

		let leftButton = UIBarButtonItem.itemWith(UIImage(named: "MenuIcon"), target: self, action: #selector(openLeftMenu))
		self.navigationItem.leftBarButtonItem = leftButton
		self.navigationItem.leftBarButtonItem?.tintColor = UIColor.blackColor()
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
	}

	override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
		return true
	}

	// MARK:- Action method

	@IBAction func signIn(sender: AnyObject) {
		let mail: String! = self.email.text
		let pass: String! = self.password.text

		if (mail.isEmpty || pass.isEmpty || !validation.emailIsValid(mail) || !validation.passwordIsValid(pass)) {
			NSLog("email/pass is empty/invalid")

			if (mail.isEmpty || !validation.emailIsValid(mail)) {
				NSLog("email is empty/invalid")

				self.email.layer.borderColor = UIColor.redColor().CGColor
			}
			else {
				self.email.layer.borderColor = UIColor.blackColor().CGColor
			}

			if (pass.isEmpty || !validation.passwordIsValid(pass)) {
				NSLog("pass is empty/invalid")

				self.password.layer.borderColor = UIColor.redColor().CGColor
			}
			else {
				self.password.layer.borderColor = UIColor.blackColor().CGColor
			}

			showAlertBox()
		}
		else {
			NSLog("eamil, pass is valid")

			self.password.layer.borderColor = UIColor.blackColor().CGColor
			self.email.layer.borderColor = UIColor.blackColor().CGColor

			self.performSegueWithIdentifier("showHomeViewSegue", sender: self)
		}
	}

	private func showAlertBox() {
		let alertBox = UIAlertController(title: "Incorrect email or password", message:
				"You typed the wrong email or password! \n Click to Continue to correct the fault.", preferredStyle: UIAlertControllerStyle.Alert)
		alertBox.addAction(UIAlertAction(title: "Continue", style: UIAlertActionStyle.Default, handler: nil))

		self.presentViewController(alertBox, animated: true, completion: nil)
	}

	func openLeftMenu() {
		self.getEasySlide().openMenu(.LeftMenu, animated: true, completion: { })
	}

	private func getEasySlide() -> ESNavigationController {
		return self.navigationController as! ESNavigationController
	}
}

extension UIViewController {
	func hideKeyboard() {
		let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
		view.addGestureRecognizer(tap)
	}

	func dismissKeyboard() {
		view.endEditing(true)
	}
}
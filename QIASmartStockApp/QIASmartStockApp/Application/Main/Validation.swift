//
//  Validation.swift
//  QIA Smart Stock App
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class Validation {
	static let sharedInstance = Validation()

	private init() {

	}

	func emailIsValid(email: String) -> Bool {
		let regExp: String
		regExp = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}"
		let filter = NSPredicate(format: "SELF MATCHES %@", regExp)

		return filter.evaluateWithObject(email)
	}

	func passwordIsValid(password: String) -> Bool {
		if password.characters.count <= 5 {
			return false
		}
		return true
	}
}

// var valid = Validation.sharedInstance

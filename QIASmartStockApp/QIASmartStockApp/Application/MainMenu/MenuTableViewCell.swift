//
//  MenuTableViewCell.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

	static let CELL_ID = "MenuTableViewCellId"

	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = UIColor.clearColor()
	}

	override func setSelected(selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
	}

	override func layoutSubviews() {
		super.layoutSubviews()
        //Why so?
		self.imageView?.frame = CGRectMake(15, 5, 30, 30)
	}

}

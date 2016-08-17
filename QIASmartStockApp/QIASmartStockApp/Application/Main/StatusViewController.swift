//
//  StatusViewController.swift
//  QIASmartStockApp
//
//  Created by Mane Hambardzumyan on 8/15/16.
//  Copyright © 2016 Instigate Mobile. All rights reserved.
//

import UIKit

class StatusViewController: UIViewController {

    @IBAction func backButtonPressed(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func homeButtonPresed(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var viewControllers = self.navigationController!.viewControllers
        let lastVCIndex = viewControllers.count - 2
        
        if viewControllers[lastVCIndex] is QRcodeReaderViewController {
            viewControllers.removeAtIndex(lastVCIndex)
        }

        
        self.navigationController?.setViewControllers(viewControllers, animated: false)
    }

}

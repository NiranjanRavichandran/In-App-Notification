//
//  ViewController.swift
//  In-App-Notification
//
//  Created by Niranjan Ravichandran on 15/04/16.
//  Copyright © 2016 Adavers. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let button = UIButton(frame: CGRectMake(0, 0, 150, 40))
        button.setTitle("Notify", forState: .Normal)
        button.backgroundColor = UIColor.darkGrayColor()
        button.center = self.view.center
        button.addTarget(self, action: #selector(self.addNotification), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func addNotification() {
        let notifView = ADNotificationView(message: "My first notification")
        notifView.show()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


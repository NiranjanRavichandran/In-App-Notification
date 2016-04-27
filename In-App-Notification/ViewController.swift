//
//  ViewController.swift
//  In-App-Notification
//
//  Created by Niranjan Ravichandran on 15/04/16.
//  Copyright © 2016 Niranjan Ravichandran. All rights reserved.
//

import UIKit

class ViewController: UIViewController, ADViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
       // self.view.backgroundColor = UIColor(red: 255/255, green: 210/255, blue: 90/255, alpha: 1.0)
        let button = UIButton(frame: CGRectMake(0, 0, 150, 40))
        button.setTitle("New Notification", forState: .Normal)
        button.layer.cornerRadius = 4
        button.center = self.view.center
        button.backgroundColor = UIColor.darkGrayColor()
        button.addTarget(self, action: #selector(self.addNotification), forControlEvents: .TouchUpInside)
        self.view.addSubview(button)
        
    }
    
    func addNotification() {
        let notifView = ADNotificationView(message: "Lorem ipsum dolor sit amet", notificationType: ADNotificationType.Error, notificationWithIcon: nil)
        //notifView.backgroundColor = UIColor.redColor()
        notifView.position = ADNotificationPosition.Top
//        notifView.entryDirection = ADNotificationDirection.Bottom
//        notifView.exitDirection = ADNotificationDirection.Left
        //notifView.delegate = self
        notifView.show()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}


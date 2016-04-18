//
//  ADNotificationView.swift
//  In-App-Notification
//
//  Created by Niranjan Ravichandran on 16/04/16.
//  Copyright © 2016 Adavers. All rights reserved.
//

import UIKit

private let ADViewHeight: CGFloat = 100

public enum ADNotificationType {
    case Success
    case Alert
    case Error
}

final public class ADNotificationView: UIView {
    
    private var messageLabel = UILabel()

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Initialize with message
    convenience public init(message: String) {
        self.init(message: message, notificationType: .Alert)
    }
    
    //Initialize with message and notification type
    public init(message: String, notificationType: ADNotificationType) {
        super.init(frame: CGRectZero)
        messageLabel.text = message
        
        //Setting frame size for the notification
        self.frame.size.width = UIScreen.mainScreen().bounds.width
        
        switch notificationType {
        case .Success:
            self.backgroundColor = UIColor.greenColor()
            
        case .Alert:
            self.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 100/255, alpha: 1.0)
            
        case .Error:
            self.backgroundColor = UIColor.redColor()
            
        }
    }
    
    public func show(){
        
        //Add the notification to the current window
        UIView.animateWithDuration(0.5) {
            if let keyWindow = UIApplication.sharedApplication().keyWindow {
                keyWindow.addSubview(self)
                self.frame.size.height = ADViewHeight
            }
        }
    }
}

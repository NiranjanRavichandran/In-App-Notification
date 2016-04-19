//
//  ADNotificationView.swift
//  In-App-Notification
//
//  Created by Niranjan Ravichandran on 16/04/16.
//  Copyright © 2016 Adavers. All rights reserved.
//

import UIKit

private let ADViewHeight: CGFloat = 75

public enum ADNotificationType {
    case Success
    case Alert
    case Error
}

final public class ADNotificationView: UIView {
    
    private var messageLabel = UILabel()
    private var iconImageView = UIImageView()

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
        
        //Setting frame size for the notification
        self.frame.size.width = UIScreen.mainScreen().bounds.width
        self.frame.size.height = ADViewHeight
        
        //Frame for notitification title
        messageLabel.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 100, ADViewHeight - 10)
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.center = self.center
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .ByWordWrapping
        messageLabel.font = messageLabel.font.fontWithSize(15)
        messageLabel.text = message
        self.addSubview(messageLabel)
        
        //Frame for iconImage
        iconImageView.frame = CGRectMake(self.frame.origin.x + 15, 0, 35, 35)
        iconImageView.center.y = self.center.y
        self.addSubview(iconImageView)
        
        switch notificationType {
        case .Success:
            self.backgroundColor = UIColor(red: 0, green: 216/255, blue: 115/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "ok.png")
            
        case .Error:
            self.backgroundColor = UIColor(red: 255/255, green: 66/255, blue: 70/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "cancel.png")
            
        case .Alert:
            self.backgroundColor = UIColor(red: 43/255, green: 181/255, blue: 255/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "message.png")
            
        }
        
        self.frame.origin.y -= ADViewHeight
    }
    
    public func show(){
        
        if let keyWindow = UIApplication.sharedApplication().keyWindow {
            //To place the window
            keyWindow.windowLevel = UIWindowLevelStatusBar + 1
            keyWindow.addSubview(self)
        }
        
        //Add the notification to the current window
        UIView.animateWithDuration(0.5, animations: {
            
            self.frame.origin.y += ADViewHeight
            
            }) { (animationDidComplete) in
                
                //After notification is diplayed
        }
        
    }
}

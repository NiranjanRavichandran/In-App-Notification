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
    case Blur
}

final public class ADNotificationView: UIVisualEffectView {
    
    private var messageLabel = UILabel()
    private var iconImageView = UIImageView()
    private var button = UIButton()
    public var duration: NSTimeInterval = 3

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    //Initialize with message
    convenience public init(message: String) {
        self.init(message: message, notificationType: .Alert)
    }
    
    //Initialize with message and notification type
    public init(message: String, notificationType: ADNotificationType) {
        super.init(effect: UIBlurEffect(style: .Dark))
        //super.init(frame: CGRectZero)
        
        //Setting frame size for the notification
        self.frame.size.width = UIScreen.mainScreen().bounds.width
        self.frame.size.height = ADViewHeight
        
        //Frame for iconImage
        iconImageView.frame = CGRectMake(self.frame.origin.x + 15, 0, 35, 35)
        iconImageView.center.y = self.center.y
        self.addSubview(iconImageView)
        
        switch notificationType {
        case .Success:
            self.effect = UIBlurEffect(style: .Light)
            self.backgroundColor = UIColor(red: 0, green: 216/255, blue: 115/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "ok.png")
            
        case .Error:
            self.effect = UIBlurEffect(style: .Light)
            self.backgroundColor = UIColor(red: 255/255, green: 66/255, blue: 70/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "cancel.png")
            
        case .Alert:
            self.effect = UIBlurEffect(style: .Light)
            self.backgroundColor = UIColor(red: 43/255, green: 181/255, blue: 255/255, alpha: 1.0)
            iconImageView.image = UIImage(named: "message.png")
            
        case .Blur: break
            
        }
        
        //Frame for notitification title
        messageLabel.frame = CGRectMake(0, 0, UIScreen.mainScreen().bounds.width - 50, ADViewHeight - 10)
        messageLabel.textAlignment = NSTextAlignment.Center
        messageLabel.textColor = UIColor.whiteColor()
        messageLabel.center.y = self.center.y
        
        messageLabel.numberOfLines = 0
        messageLabel.lineBreakMode = .ByWordWrapping
        messageLabel.font = messageLabel.font.fontWithSize(15)
        messageLabel.text = message
        self.addSubview(messageLabel)
        
        
        self.frame.origin.y -= ADViewHeight
    }
    
    
    public func show(){
        
        if let keyWindow = UIApplication.sharedApplication().keyWindow {
            //To place the view over status bar
            keyWindow.windowLevel = UIWindowLevelStatusBar + 1
            keyWindow.addSubview(self)
        }
        
        //Add the notification to the current window
        UIView.animateWithDuration(0.5, animations: {
            
            self.frame.origin.y += ADViewHeight
            
            }) { (animationDidComplete) in
                
                //After notification is diplayed
                NSTimer.scheduledTimerWithTimeInterval(self.duration, target: self, selector: #selector(self.hideNotification), userInfo: nil, repeats: false)
        }
    }
    
    
    //Hide notification method
    @objc private func hideNotification(){
        
        UIView.animateWithDuration(0.5, animations: { 
            self.frame.origin.y -= ADViewHeight
            }) { (completion) in
                if completion {
                    for item in self.subviews {
                        item.removeFromSuperview()
                    }
                    self.removeFromSuperview()
                    if let keyWindow = UIApplication.sharedApplication().keyWindow {
                        //Reset window level
                        keyWindow.windowLevel = UIWindowLevelNormal
                    }
                }
        }
    }
}

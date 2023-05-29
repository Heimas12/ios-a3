//
//  UIBarButtonItem+ extension.swift
//  Uninn
//
//  Created by nav on 2018/5/15.
//  Copyright © 2018年 Chris.C. All rights reserved.
//

import Foundation

public extension UIBarButtonItem {
    class func item(image:UIImage , target:Any, action:Selector)-> UIBarButtonItem {
       let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        if NSStringFromSelector(action) == "navBack" {
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)
        } else {
            button.imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -30)
        }
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 60, height: 100)
        let item = UIBarButtonItem.init(customView: button)
        return item
        
    }
    class func settingItem(target:Any,action:Selector) -> UIBarButtonItem  {
        return self.item(image: UIImage.init(named: "title_bar_back")!, target: target, action: action)
    }
    class func rightItem(target:Any,action:Selector) -> UIBarButtonItem  {
        return self.item(image: UIImage.init(named: "personnel")!, target: target, action: action)
    }
    class func item(title:String, target:Any,action:Selector) -> UIBarButtonItem  {
        let button = UIButton(type: .custom)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(UIColor.lightGray, for: .disabled)
        button.setTitleColor(kMaintance_edit_color, for: .normal)
        button.setTitleColor(kMaintance_edit_color, for: .highlighted)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: -15)
        button.frame = CGRect.init(x: 0, y: 0, width: title.count * 18, height: 30)

        
        return UIBarButtonItem.init(customView: button)
    }
    
    
    class func userItem(image:UIImage , target:Any, action:Selector)-> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        button.layer.cornerRadius = 40 * 0.5
        button.layer.masksToBounds = true
        button.layer.borderColor = UIColor.white.cgColor
        button.layer.borderWidth = 2
        button.imageView?.contentMode = .scaleAspectFit
//        button.imageEdgeInsets = UIEdgeInsetsMake(5, -5, 5, 0)
        let item = UIBarButtonItem.init(customView: button)
        return item
        
    }
    class func collectItem(image:UIImage , target:Any, action:Selector)-> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setImage(image, for: .normal)
        button.addTarget(target, action: action, for: .touchUpInside)
        button.frame = CGRect.init(x: 0, y: 0, width: 40, height: 40)
        button.imageView?.contentMode = .scaleAspectFit
        let item = UIBarButtonItem.init(customView: button)
        return item
        
    }
}

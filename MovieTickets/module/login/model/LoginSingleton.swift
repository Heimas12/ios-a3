//
//  LoginSingleton.swift
//  Bookshop
//
//  Created by chris on 2023/5/11.
//

import UIKit

class LoginSingleton: NSObject {
    public var token:String?
    
    //单例
    internal static let shareInstance = LoginSingleton()
    private override init(){
        super.init()
    }
    
}

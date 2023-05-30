//
//  LoginSingleton.swift
//  Bookshop
//
//
//

import UIKit

class LoginSingleton: NSObject {
    public var token:String?
    
    //singleton
    internal static let shareInstance = LoginSingleton()
    private override init(){
        super.init()
    }
    
}

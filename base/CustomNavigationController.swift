//
//  CustomNavigationController.swift
//  Bookshop
//
//  Created by Chris on 2023/5/20.
//

import Foundation

class CustomNavigationController: UINavigationController {
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}

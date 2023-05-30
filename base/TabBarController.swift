//
//  TabBarController.swift
//  Bookshop
//
// 
//

import UIKit



class TabBarController: UITabBarController {
    
    /// <#Description#>
    override func viewDidLoad() {
        super.viewDidLoad()
        let vc1 = CustomNavigationController(rootViewController: MoviesViewController())
        vc1.view.backgroundColor = .white
        vc1.navigationItem.title = ""
        vc1.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(systemName: "house"), tag: 0)
        
        let vc2 = CustomNavigationController(rootViewController: HistoryViewController())
        vc2.view.backgroundColor = .white
        vc2.navigationItem.title = ""
        vc2.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(systemName: "heart"), tag: 1)
        
        let vc3 = CustomNavigationController(rootViewController: AboutViewController())
        vc3.view.backgroundColor = .white
        vc3.navigationItem.title = ""
        vc3.tabBarItem = UITabBarItem.init(title: "", image: UIImage.init(systemName: "person"), tag: 2)
        
        
        self.tabBar.isTranslucent = true

        // Add the view controllers to the tab bar controller
        self.viewControllers = [vc1, vc2, vc3]

    }
    
    
}

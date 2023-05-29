//
//  AppDelegate.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import UIKit
let cartNotification = Notification.Name("CartNotification")
let logOutNotification = Notification.Name("logOut")
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow.init(frame: UIScreen.main.bounds)
        self.window?.makeKeyAndVisible()
        
//

        
        let token = UserDefaults.standard.object(forKey: "token")
        if token == nil {
//            self.loadData()
            
        }
        if token != nil {
            LoginSingleton.shareInstance.token = token as? String
            self.showMain()
        } else {
            self.showLogin()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: logOutNotification, object: nil)

        return true
    }
    
    @objc func handleNotification(_ notification: Notification) {
        // Handle notification events
//        UserDefaults.standard.set(nil, forKey: "token")
        self.showLogin()
    }
    
    func showLogin() -> Void {
        let vc = LoginViewController()
        vc.showPage = {() -> () in
            self.showMain()
        }
        self.window?.rootViewController = UINavigationController.init(rootViewController: vc)
    }
    func showMain() -> Void {
        let tabbarC = TabBarController()
        self.window?.rootViewController = tabbarC
        self.window?.makeKeyAndVisible()
    }
    
//    @objc func logOut() {
//        UserDefaults.standard.set(nil, forKey: "token")
//    }
    
//    func loadData() {
//        let dbHelper = DBHelper.shared
//        let names = ["识字大王", "幼儿睡前故事绘本","十万个为什么", "立体书","早教启蒙手指点读机", "幼儿启蒙教材","阳光宝贝", "小小科学家"]
//        for name in names {
//            let randomInt = Int.random(in: 1...10000)
//            var author = "安徒生\(randomInt)"
//            dbHelper.insertData(tableName: "book", name: name, category: "童书", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "幼儿启蒙", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "教育考试", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "考试", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "文学小说", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "文学", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "人文社科", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "历史", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "科技IT", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "医学", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "经管励志", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "励志成功", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "艺术", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "音乐", categoryImageName: "child")
//            dbHelper.insertData(tableName: "book", name: name, category: "生活", imageName: "child", price: 16.8, author: author, desc: "智能儿童点读笔套装全科启蒙67册套装儿童故事机礼物",  secCategory: "健身保健", categoryImageName: "child")
//        }
//    }


//    // MARK: UISceneSession Lifecycle
//
//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
//        // Called when a new scene session is being created.
//        // Use this method to select a configuration to create the new scene with.
//        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
//    }
//
//    @available(iOS 13.0, *)
//    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
//        // Called when the user discards a scene session.
//        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//    }


}




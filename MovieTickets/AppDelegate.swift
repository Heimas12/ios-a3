//
//  AppDelegate.swift
//  MovieTickets
//
// 
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
            self.showSplash()
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: logOutNotification, object: nil)

        return true
    }
    
    @objc func handleNotification(_ notification: Notification) {
        // Handle notification events
//        UserDefaults.standard.set(nil, forKey: "token")
        self.showLogin()
    }
    
    func showSplash() -> Void {
        let vc = SplashViewController()
        vc.showPage = {() -> () in
            self.showLogin()
        }
        self.window?.rootViewController = UINavigationController.init(rootViewController: vc)
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




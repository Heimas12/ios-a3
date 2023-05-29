//
//  MenuViewController.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import Foundation

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let menuItems = ["Comedy", "Action","Mystery", "Romance"] // 菜单项数组
        
        var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // 创建 UITableView，并设置数据源和代理
            tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .plain)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .white
            
            // 注册 UITableViewCell 类
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
            tableView.separatorStyle = .none

            view.addSubview(tableView)
        }
        
        // UITableViewDataSource 方法
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
            cell.textLabel?.text = menuItems[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        
        // UITableViewDelegate 方法
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // 处理选中菜单项的操作
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "type"), object: nil, userInfo: ["row":indexPath.row])
            // 收起侧边栏
            self.dismiss(animated: true)
        }
        
        // 显示侧边栏
        func showSideMenu() {
            if let mainWindow = UIApplication.shared.windows.first {
                // 创建容器视图
                let containerView = UIView(frame: mainWindow.bounds)
                containerView.backgroundColor = UIColor(white: 0, alpha: 0.5) // 设置背景色为半透明
                
                // 将侧边栏视图添加到容器视图
                containerView.addSubview(view)
                view.frame.origin.x = 0
                
                // 将容器视图添加到主窗口
                mainWindow.addSubview(containerView)
                
                // 添加手势识别器，点击容器视图时隐藏侧边栏
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideSideMenu))
                containerView.addGestureRecognizer(tapGesture)
                
                // 执行侧边栏的展示动画
                UIView.animate(withDuration: 0.3) {
                    containerView.frame.origin.x = mainWindow.bounds.width / 2
                }
            }
        }
        
        // 隐藏侧边栏
        @objc func hideSideMenu() {
            if let mainWindow = UIApplication.shared.windows.first,
               let containerView = mainWindow.subviews.first(where: { $0 is UIView && $0.backgroundColor == UIColor(white: 0, alpha: 0.5) }) {
                // 执行侧边栏的隐藏动画
                UIView.animate(withDuration: 0.3, animations: {
                    containerView.frame.origin.x = 0
                }) { (_) in
                    // 移除容器视图
                    containerView.removeFromSuperview()
                }
            }
        }
}


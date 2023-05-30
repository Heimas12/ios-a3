//
//  MenuViewController.swift
//  MovieTickets
//
//

import Foundation

import UIKit

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let menuItems = ["Comedy", "Action","Mystery", "Romance"] // array of menu items
        
        var tableView: UITableView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            
            // Create a UITableView, and set the data source and proxy
            tableView = UITableView(frame: CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height), style: .plain)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.backgroundColor = .white
            
            // Register the UITableViewCell class
            tableView.register(UITableViewCell.self, forCellReuseIdentifier: "MenuItemCell")
            tableView.separatorStyle = .none

            view.addSubview(tableView)
        }
        
        // UITableViewDataSource method
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return menuItems.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MenuItemCell", for: indexPath)
            cell.textLabel?.text = menuItems[indexPath.row]
            cell.selectionStyle = .none
            return cell
        }
        
        // UITableViewDelegate methods
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            // Handles the operation of selecting a menu item
            NotificationCenter.default.post(name: NSNotification.Name(rawValue: "type"), object: nil, userInfo: ["row":indexPath.row])
            // collapse sidebar
            self.dismiss(animated: true)
        }
        
        // show sidebar
        func showSideMenu() {
            if let mainWindow = UIApplication.shared.windows.first {
                // Create a container view
                let containerView = UIView(frame: mainWindow.bounds)
                containerView.backgroundColor = UIColor(white: 0, alpha: 0.5) // Set the background color to translucent
                
                // Add sidebar view to container view
                containerView.addSubview(view)
                view.frame.origin.x = 0
                
                // Add container view to main window
                mainWindow.addSubview(containerView)
                
                // Add gesture recognizer to hide sidebar when container view is tapped
                let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideSideMenu))
                containerView.addGestureRecognizer(tapGesture)
                
                // Execute the display animation of the sidebar
                UIView.animate(withDuration: 0.3) {
                    containerView.frame.origin.x = mainWindow.bounds.width / 2
                }
            }
        }
        
        // hide sidebar
        @objc func hideSideMenu() {
            if let mainWindow = UIApplication.shared.windows.first,
               let containerView = mainWindow.subviews.first(where: { $0 is UIView && $0.backgroundColor == UIColor(white: 0, alpha: 0.5) }) {
                // Perform the hide animation of the sidebar
                UIView.animate(withDuration: 0.3, animations: {
                    containerView.frame.origin.x = 0
                }) { (_) in
                    // remove container view
                    containerView.removeFromSuperview()
                }
            }
        }
}


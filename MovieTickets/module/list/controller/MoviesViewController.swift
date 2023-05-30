//
//  MoviesViewController.swift
//  MovieTickets
//
//
//

import UIKit
import SideMenu

class MoviesViewController: UIViewController {

    let source: [[MovieInfo]] = [
        [
            MovieInfo(imageName: "1", title: "Joyful Noise"),
            MovieInfo(imageName: "2", title: "Intouchables"),
            MovieInfo(imageName: "3", title: "The Grinch"),
            MovieInfo(imageName: "4", title: "The Chaplin")
        ],
        [
            MovieInfo(imageName: "5", title: "Percy Jackson"),
            MovieInfo(imageName: "6", title: "The island"),
            MovieInfo(imageName: "7", title: "Gone Grial"),
            MovieInfo(imageName: "8", title: "The Tower")
        ],
        [
            MovieInfo(imageName: "9", title: "The ABC murder"),
            MovieInfo(imageName: "10", title: "The murder on the orient express"),
            MovieInfo(imageName: "11", title: "Tell tale"),
            MovieInfo(imageName: "12", title: "Gattaca")
        ],
        [
            MovieInfo(imageName: "13", title: "Titanic"),
            MovieInfo(imageName: "14", title: "Meet Joe Black"),
            MovieInfo(imageName: "15", title: "Romance"),
            MovieInfo(imageName: "16", title: "Dear John")
        ]
       ]
    var items: [MovieInfo] = []
    var collectionView: UICollectionView!
    var sideMenuNavigationController = SideMenuNavigationController(rootViewController: MenuViewController())
       override func viewDidLoad() {
           super.viewDidLoad()
           
           items = self.source[0]
           
           // Create UICollectionViewFlowLayout to set the layout
           let layout = UICollectionViewFlowLayout()
           layout.scrollDirection = .vertical
           layout.minimumInteritemSpacing = 10
           layout.minimumLineSpacing = 10
           let itemWidth = (view.bounds.width - 30) / 4 // Display 2 items per row
           layout.itemSize = CGSize(width: itemWidth, height: itemWidth + 70) // Set the size of the item
           
           //Create a UICollectionView, and set the layout and proxy
           collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: layout)
           collectionView.dataSource = self
           collectionView.delegate = self
           collectionView.backgroundColor = .white
           
           // Register a custom UICollectionViewCell class
           collectionView.register(MovieCell.self, forCellWithReuseIdentifier: "MovieCell")
           
           view.addSubview(collectionView)
           
        
           sideMenuNavigationController.leftSide = true // Show the sidebar on the left
           sideMenuNavigationController.menuWidth = 100
           
           // Add a button on the left side of the navigation bar
           let leftBarButtonItem = UIBarButtonItem(title: "Menu", style: .plain, target: self, action: #selector(showMenu))
           navigationItem.leftBarButtonItem = leftBarButtonItem
           
           NotificationCenter.default.addObserver(self, selector: #selector(handleNotification(_:)), name: NSNotification.Name(rawValue: "type"), object: nil)
          
       }
    
        @objc func showMenu() {
            present(sideMenuNavigationController, animated: true, completion: nil)
       }
    
    @objc func handleNotification(_ notification: Notification) {
        if let userInfo = notification.userInfo {
            if let value = userInfo["row"] as? Int { // Replace ValueType according to parameter type
                // Process the received parameters
                items = source[value ]
                self.collectionView.reloadData()
            }
        }
    }

}

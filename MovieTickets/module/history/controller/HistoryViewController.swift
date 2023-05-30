//
//  HistoryViewController.swift
//  Bookshop
//
//  

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    @IBOutlet weak var tableView: UITableView!
    var historys: [HistoryModel] = []

    var querySring: String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "purchased list"

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(HistoryCell.self, forCellReuseIdentifier: "HistoryCellIdentifier")

        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadBooks()
    }
    
    // Load book information
    func loadBooks() {
        // TODO: Load booking information
        let dbHelper = DBHelper.shared
        self.historys = dbHelper.fetchHistoryData()
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historys.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCellIdentifier", for: indexPath) as! HistoryCell
        
        let histoyModel = historys[indexPath.row]
        cell.configure(with: histoyModel)
        cell.selectionStyle = .none
        return cell
    }
    
    // MARK: - Table view delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let book = books[indexPath.row]
//        let detailVC = BookDetailViewController()
//        detailVC.book = book
//        self.navigationController?.pushViewController(detailVC, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            
        }
        
        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }
        
        func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
            return .delete
        }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "unsubscribe") { (action, view, completion) in
            // perform delete operation
            let hisory = self.historys[indexPath.row]
            let helper = DBHelper.shared
            if helper.deleteHistoryData(orderNum: hisory.orderNum) {
                self.historys.remove(at: indexPath.row)
                tableView.reloadData()
            }
            
            completion(true)
        }
        
        // Modify the background color of the delete operation
        deleteAction.backgroundColor = .red
        
        // Returns a configuration object containing a custom delete action
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }

}

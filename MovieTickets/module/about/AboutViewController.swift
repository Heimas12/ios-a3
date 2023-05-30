import UIKit

class AboutViewController: UITableViewController {
    private var registerButton:UIButton?
    var aboutData = [
        ("version", "1.0.0"),
        ("username", "John Doe"),
        ("birthday", "John Doe"),
        ("email", "123456789"),
        ("phone", "John Smith")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set page title
        self.navigationItem.title = "about"

        // Register a custom UITableViewCell class
        tableView.register(AboutTableViewCell.self, forCellReuseIdentifier: "AboutCell")
        
        // Style the UITableView
        tableView.separatorStyle = .none
        tableView.backgroundColor = .white
        
//        self.registerButton = UIButton(type: .custom)
//        self.registerButton?.setTitle("log out", for:.normal)
//        self.registerButton?.setTitleColor(KlandPageBtn_normal_color, for: .normal)
//        self.registerButton?.titleLabel?.font = UIFont.systemFont(ofSize: 11)
//        self.registerButton?.frame = CGRect.init(x: kScreenWidth - 30 - 100, y: 70 + 44 + 10, width: 100, height: 44)
//        self.registerButton?.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
//        self.view.addSubview(self.registerButton!)
                loadData()
        
        // Create exit button
        let logoutButton = UIBarButtonItem(title: "log out", style: .plain, target: self, action: #selector(logoutButtonTapped))
        // Add an exit button to the right side of the navbar
        navigationItem.rightBarButtonItem = logoutButton
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    
    func loadData()  {
        let userInfo = UserDefaults.standard.object(forKey: "userInfo") as! [String:String]

        let username = userInfo["username"]! as String
        let birthday = userInfo["birthday"]! as String
        let email = userInfo["email"]! as String
        let phone = userInfo["phone"]! as String
        aboutData = [
            ("version", "1.0.0"),
            ("username", username),
            ("birthday", birthday),
            ("email", email),
            ("phone", phone)
        ]
        self.tableView.reloadData()
    }
    
    // Exit button click event
        @objc func logoutButtonTapped() {
            // Logic to handle exit button clicks
            NotificationCenter.default.post(name: logOutNotification, object: nil, userInfo: nil)
        }
    
    // MARK: - UITableViewDataSource
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return aboutData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AboutCell", for: indexPath) as! AboutTableViewCell
        
        let data = aboutData[indexPath.row]
        cell.titleLabel.text = data.0
        cell.detailLabel.text = data.1
        cell.selectionStyle = .none
        return cell
    }
}


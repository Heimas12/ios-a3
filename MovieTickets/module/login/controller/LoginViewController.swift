//
//  LoginViewController.swift
//  Bookshop
//
//

import UIKit


private let LoginCellId = "LoginCellId"
class LoginViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate  {
    
    //Declaring closures
    typealias loginCloser = () -> ()
    //Define a variable type that is the closure declared above
    var showPage: loginCloser?
    private var subView:LoginView?
    private var isUsernameValid:Bool? = false
    private var isPasswordValid:Bool? = false
    private var loginButton:UIButton?
    private var registerButton:UIButton?
    private var userNameTextField:UITextField?
    private var pwdTextField:UITextField?
    private var userNameline:UIView?
    private var pwdline:UIView?


    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Log in"
        self.setUpUI()

        subView = LoginView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .grouped)
        subView?.delegate = self;
        subView?.dataSource = self;
        self.view.addSubview(subView!)
        let footerView = UIView()
        footerView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 200)
        
        self.subView?.tableFooterView = footerView
        footerView.addSubview(self.loginButton!)
        footerView.addSubview(self.registerButton!)
        
        let singleTap = UITapGestureRecognizer(target: self, action: #selector(fingerTapped))
        self.view.addGestureRecognizer(singleTap)
        self.usernameTextFieldChanged()
        self.passwordTextFieldChanged()
        
    }
    
    @objc func fingerTapped() -> Void {
        self.view.endEditing(true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: LoginCellId)
        
        if (cell == nil) {
            cell = LoginCell.init(style: .default, reuseIdentifier: LoginCellId)
            if indexPath.row == 0 {
                cell?.contentView.addSubview(self.userNameTextField!);
                cell?.contentView.addSubview(self.userNameline!)
            } else {
                cell?.contentView.addSubview(self.pwdTextField!)
                cell?.contentView.addSubview(self.pwdline!)
            }
        }
        
        cell?.selectionStyle = .none
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.001
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return kScreenHeight <= 568 ? 10 : 50
    }
    //    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    //        return 80
    //    }
    
    fileprivate var footerView:UIView {
        let footerView = UIView()
        footerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 100);
        footerView.backgroundColor = UIColor.red
        return footerView
    }
    
    
    func setUpUI() {
        
        //loginButton
        self.loginButton = UIButton(type: .custom)
        self.loginButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .disabled)
        self.loginButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .highlighted)
        self.loginButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .normal)
        self.loginButton?.layer.cornerRadius = 5
        self.loginButton?.layer.masksToBounds = true
        self.loginButton?.setTitle("Log in", for:.normal)
        self.loginButton?.setTitleColor(kBackground_color, for: .normal)
        self.loginButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.loginButton?.frame = CGRect.init(x: 30, y: 70, width: (kScreenWidth - 2 * 30), height: 44)
        self.loginButton?.isEnabled = false
        self.loginButton?.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        //registerButton
        self.registerButton = UIButton(type: .custom)
//        self.registerButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .disabled)
//        self.registerButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .highlighted)
//        self.registerButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .normal)
//        self.registerButton?.layer.cornerRadius = 5
//        self.registerButton?.layer.masksToBounds = true
        self.registerButton?.setTitle("sign up", for:.normal)
        self.registerButton?.setTitleColor(KlandPageBtn_normal_color, for: .normal)
        self.registerButton?.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        self.registerButton?.frame = CGRect.init(x: kScreenWidth - 30 - 100, y: 70 + 44 + 10, width: 100, height: 34)
        self.registerButton?.addTarget(self, action: #selector(register), for: .touchUpInside)
        
        //userNameTextField
        self.userNameTextField  = UITextField()
        self.userNameTextField?.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth - 2 * 20, height: 60)
        self.userNameTextField?.borderStyle = .none
        self.userNameTextField?.placeholder = "username"
        self.userNameTextField?.returnKeyType  = .next
        self.userNameTextField?.addTarget(self, action: #selector(usernameTextFieldChanged), for: .editingChanged)
        self.userNameTextField?.delegate = self
        self.userNameTextField?.autocorrectionType = .no
        self.userNameTextField?.keyboardType = .default
        
        //pwdTextField
        self.pwdTextField = UITextField()
        self.pwdTextField?.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth - 2 * 20, height: 60)
        self.pwdTextField?.borderStyle = .none
        self.pwdTextField?.placeholder = "password"
        self.pwdTextField?.isSecureTextEntry = true
        self.pwdTextField?.clearButtonMode  = .whileEditing
        self.pwdTextField?.returnKeyType  = .go
        self.pwdTextField?.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        self.pwdTextField?.delegate = self
        self.pwdTextField?.autocorrectionType = .no
        self.pwdTextField?.keyboardType = .asciiCapable


        self.userNameline = UIView()
        self.userNameline?.frame = CGRect.init(x: 20, y: 60, width: kScreenWidth - 2 * 20, height: 1)
        self.userNameline?.backgroundColor = KloginBtn_disable_color;
        
        self.pwdline = UIView()
        self.pwdline?.frame = CGRect.init(x: 20, y: 60, width: kScreenWidth - 2 * 20, height: 1)
        self.pwdline?.backgroundColor = KloginBtn_disable_color;
    }
    
    
    @objc func usernameTextFieldChanged() {
        
        if let userName = self.userNameTextField?.text, userName.count > 0 {
            self.isUsernameValid = true
            self.userNameline?.backgroundColor = KloginBtn_normal_color
        } else {
            self.isUsernameValid = false
            self.userNameline?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
    }
    @objc func passwordTextFieldChanged() {
        if let pwd = self.pwdTextField?.text, pwd.count > 0 {
            self.isPasswordValid = true
            self.pwdline?.backgroundColor = KloginBtn_normal_color

        } else {
            self.isPasswordValid = false
            self.pwdline?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
        
    }
    func updateUI() {
        if self.isUsernameValid == true && self.isPasswordValid == true {
            self.loginButton?.isEnabled = true
        } else {
            self.loginButton?.isEnabled = false
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if (self.userNameTextField != nil) {
            self.userNameTextField?.becomeFirstResponder()
        }
        
        if let pwd = self.pwdTextField?.text,let name = self.userNameTextField?.text, pwd.count > 0 && name.count > 0 {
            self.login()
        }
        
        return true
    }
    
    @objc func login() {
        self.view.endEditing(true)
        
        let token = UserDefaults.standard.string(forKey: "token")

        if let string1 = self.userNameTextField?.text , let string2 = self.pwdTextField?.text {
            let tokenString = string1 + string2
            if token == tokenString.md5 {
                SVProgressHUD.showSuccess(withStatus: "login success")
                // 进入主页
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    self.showPage!()
                }

            }
            
        } else {
            SVProgressHUD.showError(withStatus: "login failed")
        }
    }
    
    
    @objc func register() {
        self.navigationController?.pushViewController(RegisterViewController.init(), animated: true)
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}

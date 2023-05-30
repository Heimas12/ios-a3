//
//  RegisterViewController.swift
//  Bookshop
//
//
//

import UIKit
private let LoginCellId = "LoginCellId"
class RegisterViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate  {

    //Declaring closures
    typealias loginCloser = () -> ()
    //Define a variable type that is the closure declared above
    var showPage: loginCloser?
    private var subView:LoginView?
    private var isUsernameValid:Bool? = false
    private var isPasswordValid:Bool? = false
    private var registButton:UIButton?
    private var userNameTextField:UITextField?
    private var pwdTextField:UITextField?
    
    private var birthTextField:UITextField?
    private var emailTextField:UITextField?
    private var phoneNumTextField:UITextField?

    private var userNameline:UIView?
    private var pwdline:UIView?
    private var bithLine:UIView?
    private var emailLine:UIView?
    private var phoneLine:UIView?



    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sign Up"
        self.setUpUI()

        subView = LoginView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight), style: .grouped)
        subView?.delegate = self;
        subView?.dataSource = self;
        self.view.addSubview(subView!)
        let footerView = UIView()
        footerView.frame = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 250)
        
        self.subView?.tableFooterView = footerView
        footerView.addSubview(self.registButton!)

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
        return 6;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: LoginCellId)
        
        if (cell == nil) {
            cell = LoginCell.init(style: .default, reuseIdentifier: LoginCellId)
            if indexPath.row == 0 {
                cell?.contentView.addSubview(self.userNameTextField!);
                cell?.contentView.addSubview(self.userNameline!)
            } else if indexPath.row == 1  {
                cell?.contentView.addSubview(self.pwdTextField!)
                cell?.contentView.addSubview(self.pwdline!)

            }  else if indexPath.row == 2  {
                cell?.contentView.addSubview(self.birthTextField!)
                cell?.contentView.addSubview(self.bithLine!)

            } else if indexPath.row == 3  {
                cell?.contentView.addSubview(self.emailTextField!)
                cell?.contentView.addSubview(self.emailLine!)

            } else if indexPath.row == 4 {
                cell?.contentView.addSubview(self.phoneNumTextField!)
                cell?.contentView.addSubview(self.phoneLine!)

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
        footerView.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 250);
        footerView.backgroundColor = UIColor.red
        return footerView
    }
    
    
    func setUpUI() {
        
        //registButton
        self.registButton = UIButton(type: .custom)
        self.registButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .disabled)
        self.registButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .highlighted)
        self.registButton?.setBackgroundImage(UIImage.image(color:  KlandPageBtn_normal_color), for: .normal)
        self.registButton?.layer.cornerRadius = 5
        self.registButton?.layer.masksToBounds = true
        self.registButton?.setTitle("Sign Up", for:.normal)
        self.registButton?.setTitleColor(kBackground_color, for: .normal)
        self.registButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        self.registButton?.frame = CGRect.init(x: 30, y: 70, width: (kScreenWidth - 2 * 30), height: 44)
        self.registButton?.isEnabled = false
        self.registButton?.addTarget(self, action: #selector(login), for: .touchUpInside)
        
        
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
//        self.pwdTextField?.isSecureTextEntry = true
        self.pwdTextField?.clearButtonMode  = .whileEditing
        self.pwdTextField?.returnKeyType  = .go
        self.pwdTextField?.addTarget(self, action: #selector(passwordTextFieldChanged), for: .editingChanged)
        self.pwdTextField?.delegate = self
        self.pwdTextField?.autocorrectionType = .no
        self.pwdTextField?.keyboardType = .asciiCapable
        
        //birthTextField
        self.birthTextField  = UITextField()
        self.birthTextField?.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth - 2 * 20, height: 60)
        self.birthTextField?.borderStyle = .none
        self.birthTextField?.placeholder = "birthday"
        self.birthTextField?.returnKeyType  = .next
        self.birthTextField?.addTarget(self, action: #selector(birthTextFieldChanged), for: .editingChanged)
        self.birthTextField?.delegate = self
        self.birthTextField?.autocorrectionType = .no
        self.birthTextField?.keyboardType = .default
        
        
        //emailTextField
        self.emailTextField  = UITextField()
        self.emailTextField?.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth - 2 * 20, height: 60)
        self.emailTextField?.borderStyle = .none
        self.emailTextField?.placeholder = "email"
        self.emailTextField?.returnKeyType  = .next
        self.emailTextField?.addTarget(self, action: #selector(emailTextFieldChanged), for: .editingChanged)
        self.emailTextField?.delegate = self
        self.emailTextField?.autocorrectionType = .no
        self.emailTextField?.keyboardType = .default
        
        //phoneNumTextField
        self.phoneNumTextField  = UITextField()
        self.phoneNumTextField?.frame = CGRect.init(x: 20, y: 0, width: kScreenWidth - 2 * 20, height: 60)
        self.phoneNumTextField?.borderStyle = .none
        self.phoneNumTextField?.placeholder = "phone"
        self.phoneNumTextField?.returnKeyType  = .next
        self.phoneNumTextField?.addTarget(self, action: #selector(phoneNumTextFieldChanged), for: .editingChanged)
        self.phoneNumTextField?.delegate = self
        self.phoneNumTextField?.autocorrectionType = .no
        self.phoneNumTextField?.keyboardType = .default


        self.userNameline = creatLineView();
        self.pwdline = creatLineView();
        self.bithLine = creatLineView();
        self.emailLine = creatLineView();
        self.phoneLine = creatLineView();
    }
    
    func creatLineView() -> UIView {
        let view = UIView()
        view.frame = CGRect.init(x: 20, y: 60, width: kScreenWidth - 2 * 20, height: 1)
        view.backgroundColor = KloginBtn_disable_color;
        return view;
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
        
        if let userName = self.pwdTextField?.text, userName.count > 0 {
            self.isPasswordValid = true
            self.pwdline?.backgroundColor = KloginBtn_normal_color
        } else {
            self.isPasswordValid = false
            self.pwdline?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
    }
   
    @objc func birthTextFieldChanged() {
        
        if let userName = self.birthTextField?.text, userName.count > 0 {
//            self.isUsernameValid = true
            self.bithLine?.backgroundColor = KloginBtn_normal_color
        } else {
//            self.isUsernameValid = false
            self.bithLine?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
    }
    
    @objc func emailTextFieldChanged() {
        
        if let userName = self.emailTextField?.text, userName.count > 0 {
//            self.isUsernameValid = true
            self.emailLine?.backgroundColor = KloginBtn_normal_color
        } else {
//            self.isUsernameValid = false
            self.emailLine?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
    }
    
    @objc func phoneNumTextFieldChanged() {
        
        if let userName = self.phoneNumTextField?.text, userName.count > 0 {
//            self.isUsernameValid = true
            self.phoneLine?.backgroundColor = KloginBtn_normal_color
        } else {
//            self.isUsernameValid = false
            self.phoneLine?.backgroundColor = KloginBtn_disable_color

        }
        self.updateUI()
    }
    
    func updateUI() {
        if self.isUsernameValid == true && self.isPasswordValid == true {
            self.registButton?.isEnabled = true
        } else {
            self.registButton?.isEnabled = false
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
       
        //token persistence
        if let string1 = self.userNameTextField?.text , let string2 = self.pwdTextField?.text {
            let tokenString = string1 + string2
            UserDefaults.standard.set(tokenString.md5, forKey: "token")
            UserDefaults.standard.synchronize()
//            let helper = DBHelper.shared
//            helper.insertUserData(token: tokenString.md5, name: self.nameTextField?.text ?? "", stuNum: self.birthTextField?.text ?? "", email: self.emailTextField?.text ?? "", phoneNum: self.phoneNumTextField?.text ?? "")
            cacheUserInfo()
            SVProgressHUD.showSuccess(withStatus: "Sign Up success")
            
            // back login
            DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                self.showSuccessPage()
            }
            
        } else {
            SVProgressHUD.showError(withStatus: "Sign Up failed")
        }
        
    }
    
    func cacheUserInfo()  {
        var info:[String:String] = [:]
        info["username"] = self.userNameTextField?.text
        info["birthday"] = self.birthTextField?.text
        info["email"] = self.emailTextField?.text
        info["phone"] = self.phoneNumTextField?.text
        UserDefaults.standard.set(info, forKey: "userInfo")
        UserDefaults.standard.synchronize()

    }
    
    func showSuccessPage() {
        let successVC = SignUpSuccessViewController()
        successVC.desc = "Congratulations! Registration Successful!"
        successVC.showPage = {() -> () in
            self.navigationController?.popViewController(animated: true)
        }
        successVC.modalPresentationStyle = .fullScreen
        present(successVC, animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

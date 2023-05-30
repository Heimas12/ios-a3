//
//  LoginView.swift
//  Bookshop
//
//  

import UIKit

class LoginView: UITableView {
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    fileprivate func setupUI() {
        self.rowHeight = 60
        //    self.estimatedSectionFooterHeight = 0;
        //    self.estimatedSectionHeaderHeight = 0;
        //    self.rowHeight = UITableViewAutomaticDimension;
        self.separatorStyle = .none
        self.bounces = true
        self.backgroundColor = UIColor.white
    }
    
}

class LoginCell: UITableViewCell {

    //    var line : UIView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setlayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setupUI() {
        self.backgroundColor = UIColor.clear
    }
    
    fileprivate func setlayout() {
        
    }
    
    
}


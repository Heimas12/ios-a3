//
//  MovieCell.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import Foundation
import UIKit

class MovieCell: UICollectionViewCell {
    
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let buyButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // 设置图片视图
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        
        // 设置标题标签
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.systemFont(ofSize: 13)
        
        // 设置购买按钮
        buyButton.setTitle("Buy", for: .normal)
        buyButton.setTitleColor(.white, for: .normal)
        buyButton.addTarget(self, action: #selector(buyButtonTapped), for: .touchUpInside)
        buyButton.backgroundColor = KlandPageBtn_normal_color
        buyButton.layer.cornerRadius = 15
        buyButton.layer.masksToBounds = true
        buyButton.isHidden = true
        buyButton.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        // 添加子视图
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(buyButton)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.mas_remakeConstraints({make in
            make?.left.right().top().equalTo()
            make?.height.equalTo()(100)
        })
        titleLabel.mas_remakeConstraints({make in
            make?.left.right().equalTo()
            make?.top.equalTo()(imageView.mas_bottom)?.offset()(5)
            make?.height.equalTo()(30)
        })
        buyButton.mas_remakeConstraints({make in
            make?.centerX.equalTo()
            make?.top.equalTo()(titleLabel.mas_bottom)?.offset()(5)
            make?.width.equalTo()(60)
            make?.height.equalTo()(30)
        })
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func buyButtonTapped() {
        // 处理购买按钮点击事件
    }
    
    func configure(with movie: MovieInfo) {
        imageView.image = UIImage(named: movie.imageName)
        titleLabel.text = movie.title
    }
}


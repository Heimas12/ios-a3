//
//  HistoryBookCell.swift
//  Bookshop
//
//  Created by Chris on 2023/5/25.
//

import UIKit

class HistoryCell: UITableViewCell {

    // MARK: - Properties
    
    var coverImageView: UIImageView!
    var titleLabel: UILabel!
    var locationLabel: UILabel!
    var priceLabel: UILabel!
    var countLabel: UILabel!
    var timeLabel: UILabel!
    var orderNumLabel: UILabel!
    var spendTimeLabel: UILabel!

    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupViews()
    }
    
    // MARK: - View Setup
    
    private func setupViews() {
        coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFit
        contentView.addSubview(coverImageView)
        
        titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        contentView.addSubview(titleLabel)
        
        locationLabel = UILabel()
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.font = UIFont.systemFont(ofSize: 15)
        locationLabel.textColor = UIColor.gray
        contentView.addSubview(locationLabel)
        
        priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont.systemFont(ofSize: 15)
        priceLabel.textColor = UIColor.red
        contentView.addSubview(priceLabel)
        
        countLabel = UILabel()
        countLabel.translatesAutoresizingMaskIntoConstraints = false
        countLabel.font = UIFont.systemFont(ofSize: 15)
        countLabel.textColor = UIColor.gray
        contentView.addSubview(countLabel)
        
        timeLabel = UILabel()
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 11)
        timeLabel.textColor = UIColor.gray
        contentView.addSubview(timeLabel)
        
        orderNumLabel = UILabel()
        orderNumLabel.translatesAutoresizingMaskIntoConstraints = false
        orderNumLabel.font = UIFont.systemFont(ofSize: 11)
        orderNumLabel.textColor = UIColor.gray
        contentView.addSubview(orderNumLabel)
        
        spendTimeLabel = UILabel()
        spendTimeLabel.translatesAutoresizingMaskIntoConstraints = false
        spendTimeLabel.font = UIFont.systemFont(ofSize: 11)
        spendTimeLabel.textColor = UIColor.gray
        contentView.addSubview(spendTimeLabel)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        coverImageView.mas_remakeConstraints{ make in
            make?.left.equalTo()(10)
            make?.centerY.equalTo()
            make?.width.height().equalTo()(80)
        }
        
        orderNumLabel.mas_remakeConstraints{ make in
            make?.left.equalTo()(coverImageView.mas_right)?.offset()(10)
            make?.top.equalTo()(coverImageView.mas_top)
            make?.width.equalTo()(100)
            make?.height.equalTo()(25)
        }
        timeLabel.mas_remakeConstraints{ make in
            make?.left.equalTo()(orderNumLabel.mas_right)?.offset()(10)
            make?.top.equalTo()(coverImageView.mas_top)
            make?.width.equalTo()(130)
            make?.height.equalTo()(25)
        }
        
        titleLabel.mas_remakeConstraints{ make in
            make?.left.equalTo()(coverImageView.mas_right)?.offset()(10)
            make?.top.equalTo()(timeLabel.mas_bottom)?.offset()(5)
            make?.width.equalTo()(150)
            make?.height.equalTo()(25)
        }
        locationLabel.mas_remakeConstraints{ make in
            make?.left.equalTo()(coverImageView.mas_right)?.offset()(10)
            make?.bottom.equalTo()(coverImageView.mas_bottom)
            make?.width.equalTo()(150)
            make?.height.equalTo()(25)
        }
        priceLabel.mas_remakeConstraints{ make in
            make?.right.equalTo()(self)?.offset()(-60)
            make?.centerY.equalTo()
            make?.width.equalTo()(80)
            make?.height.equalTo()(25)
        }
        countLabel.mas_remakeConstraints{ make in
            make?.right.equalTo()(self)
            make?.centerY.equalTo()
            make?.width.equalTo()(50)
            make?.height.equalTo()(25)
        }
        
        spendTimeLabel.mas_remakeConstraints{ make in
            make?.left.equalTo()(coverImageView.mas_right)?.offset()(10)
            make?.top.equalTo()(locationLabel.mas_bottom)
            make?.width.equalTo()(150)
            make?.height.equalTo()(25)
        }
    }
    
    // MARK: - Configuration
    
    func configure(with historyModel: HistoryModel) {
        coverImageView.image = UIImage(named: historyModel.imageName )
        titleLabel.text = historyModel.name
        locationLabel.text = "NO.\(historyModel.num) in \(historyModel.row) row"
        priceLabel.text = "$\(historyModel.price)"
        orderNumLabel.text = historyModel.orderNum
        timeLabel.text = historyModel.buyTime
        spendTimeLabel.text = "\(historyModel.date) \(historyModel.startTime)~\(historyModel.endTime)"
    }

}

//
//  TimeSlotCell.swift
//  MovieTickets
//
//  Created by Chris on 2023/5/26.
//

import Foundation

import UIKit

class TimeSlotCell: UITableViewCell {
    // 声明各个 UI 元素
    private let startTimeLabel = UILabel()
    private let endTimeLabel = UILabel()
    private let hallLabel = UILabel()
    private let descriptionLabel = UILabel()
    private let priceLabel = UILabel()
    private let buyButton = UIButton(type: .system)
    
    weak var delegate: TimeSlotCellDelegate?

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        // 设置各个 UI 元素的属性
        startTimeLabel.font = UIFont.systemFont(ofSize: 16)
        endTimeLabel.font = UIFont.systemFont(ofSize: 11)
        endTimeLabel.textColor = .gray
        hallLabel.font = UIFont.systemFont(ofSize: 14)
        descriptionLabel.font = UIFont.systemFont(ofSize: 11)
        descriptionLabel.isHidden = true
        priceLabel.font = UIFont.boldSystemFont(ofSize: 18)
        buyButton.setTitle("buy", for: .normal)
        buyButton.addTarget(self, action: #selector(buyTickets), for: .touchUpInside)
        buyButton.setTitleColor(KlandPageBtn_normal_color, for: .normal)
        buyButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        
        // 将 UI 元素添加到 contentView 上
        contentView.addSubview(startTimeLabel)
        contentView.addSubview(endTimeLabel)
        contentView.addSubview(hallLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        // 设置 UI 元素的约束
        // 这里使用 Masonry 布局库进行布局，你可以根据需要进行调整
        
        startTimeLabel.mas_makeConstraints { make in
            make?.top.equalTo()(self.contentView.mas_top)?.offset()(8)
            make?.left.equalTo()(self.contentView.mas_left)?.offset()(16)
            make?.width.equalTo()(60)
            make?.height.equalTo()(30)
        }
        
        endTimeLabel.mas_makeConstraints { make in
            make?.top.equalTo()(startTimeLabel.mas_bottom)?.offset()(8)
            make?.left.equalTo()(self.contentView.mas_left)?.offset()(16)
            make?.width.equalTo()(60)
            make?.height.equalTo()(30)
        }
        
        
        descriptionLabel.mas_makeConstraints { make in
            make?.top.equalTo()(self.contentView.mas_top)?.offset()(8)
            make?.left.equalTo()(startTimeLabel.mas_right)?.offset()(8)
            make?.width.equalTo()(60)
            make?.height.equalTo()(30)
        }
        
        hallLabel.mas_makeConstraints { make in
            make?.centerY.equalTo()
            make?.left.equalTo()(startTimeLabel.mas_right)?.offset()(8)
            make?.width.equalTo()(160)
            make?.height.equalTo()(30)
        }
        
        
        priceLabel.mas_makeConstraints { make in
            make?.left.equalTo()(hallLabel.mas_right)?.offset()(8)
            make?.centerY.equalTo()
            make?.width.equalTo()(80)
            make?.height.equalTo()(30)
        }
        
        buyButton.mas_makeConstraints { make in
            make?.left.equalTo()(priceLabel.mas_right)?.offset()(8)
            make?.centerY.equalTo()
            make?.width.equalTo()(60)
            make?.height.equalTo()(30)
        }
    }
    
    func configure(with timeSlot:TimeSlot) {
        // 根据时间段对象设置 UI 元素的内容
        startTimeLabel.text = "\(timeSlot.startTime)"
        endTimeLabel.text = "\(timeSlot.endTime)ends"
        hallLabel.text = "\(timeSlot.hall) laser IMAX theater"
        descriptionLabel.text = timeSlot.description
        priceLabel.text = "$\(timeSlot.price)"
    }
    
    @objc func buyTickets() {
        delegate?.buyTickets(in: self)
    }
}

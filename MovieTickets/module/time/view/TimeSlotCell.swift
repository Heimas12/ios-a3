//
//  TimeSlotCell.swift
//  MovieTickets
//
//

import Foundation

import UIKit

class TimeSlotCell: UITableViewCell {
    // Declare individual UI elements
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
        // Set properties for individual UI elements
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
        
        // Add UI elements to contentView
        contentView.addSubview(startTimeLabel)
        contentView.addSubview(endTimeLabel)
        contentView.addSubview(hallLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(buyButton)
    }
    
    private func setupConstraints() {
        // Set constraints for UI elements
        // The Masonry layout library is used here for layout, you can adjust it as needed
        
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
        // Sets the content of a UI element based on a time period object
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

import UIKit
import Masonry

class AboutTableViewCell: UITableViewCell {
    
    let titleLabel = UILabel()
    let detailLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // Set the layout and style of the title tags
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        titleLabel.textColor = .black
        contentView.addSubview(titleLabel)
        
        titleLabel.mas_makeConstraints { make in
            make?.left.equalTo()(contentView)?.offset()(16)
            make?.centerY.equalTo()
        }
        
        // Set the layout and style of the details label
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.textColor = .gray
        contentView.addSubview(detailLabel)
        
        detailLabel.mas_makeConstraints { make in
            make?.right.equalTo()(contentView)?.offset()(-16)
            make?.centerY.equalTo()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


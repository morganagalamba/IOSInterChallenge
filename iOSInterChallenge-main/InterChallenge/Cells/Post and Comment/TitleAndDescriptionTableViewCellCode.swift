//
//  TitleAndDescriptionTableViewCellCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

class TitleAndDescriptionTableViewCellCode: UITableViewCell {

    static let identifier = "TitleAndDescriptionTableViewCell"

    public let titleLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .bold)
        return label
    }()
    
    public let descriptionLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        titleLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        descriptionLabel.frame = CGRect(x: 10, y: 25, width: contentView.frame.size.width, height: contentView.frame.size.height)
                
    }

}

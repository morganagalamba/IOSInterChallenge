//
//  TitleAndDescriptionTableViewCellCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

class TitleAndDescriptionTableViewCellCode: UITableViewCell {
    
    private let padding: CGFloat = 16
    static let identifier = "TitleAndDescriptionTableViewCell"

    public let titleLabel : UILabel = {
        let label = UILabel()
        //label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .regular)
        label.numberOfLines = 2
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.clearsContextBeforeDrawing = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clipsToBounds = true
       label.autoresizesSubviews = true
      
        return label
    }()
    
    public let descriptionLabel : UILabel = {
        let label = UILabel()
        //label.textColor = .red
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 10
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        label.clipsToBounds = true
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = true
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: padding),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
        ])
        
        NSLayoutConstraint.activate([
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor ,constant: padding),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -padding/2)
        ])
        
       

       titleLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        titleLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        titleLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
        
        descriptionLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        descriptionLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        descriptionLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        descriptionLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
    }

}

//
//  PhotoTableViewCellCodeTableViewCell.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

class PhotoTableViewCellCode: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"
    
    public let myImageView : UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.autoresizesSubviews = true
        imageView.clearsContextBeforeDrawing = true
        imageView.clipsToBounds = true
        imageView.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
        return imageView
        
    }()
    
    public let myLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 5
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        label.clipsToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.clipsToBounds = true
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            myImageView.widthAnchor.constraint(equalToConstant: 150),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor),
            myImageView.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 8),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            //myImageView.trailingAnchor.constraint(equalTo: myLabel.leadingAnchor, constant: 16),
            myImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
        
        NSLayoutConstraint.activate([
            myLabel.topAnchor.constraint(equalTo: contentView.topAnchor ,constant: 60),
            myLabel.leadingAnchor.constraint(equalTo: myImageView.trailingAnchor, constant: 16),
            myLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

        ])
        
        myImageView.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        myImageView.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        myImageView.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        myImageView.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)

        myLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        myLabel.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        myLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        myLabel.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
        
       
    }
}

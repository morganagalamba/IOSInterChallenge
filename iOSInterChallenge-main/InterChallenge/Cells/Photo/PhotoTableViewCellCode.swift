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
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    public let myLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height-6
        
        myLabel.frame = CGRect(x: imageSize+20, y: 0, width: contentView.frame.size.width-10-imageSize, height: contentView.frame.size.height)
        
        myImageView.frame = CGRect(x: 10, y: 3, width: imageSize, height: imageSize)
        
    }
    
    
}

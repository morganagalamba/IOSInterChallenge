//
//  AlbumTableViewCellCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

class AlbumTableViewCellCode: UITableViewCell {
    
    static let identifier = "AlbumTableViewCell"

    public let albumNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.contentMode = .left
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        contentView.addSubview(albumNameLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        albumNameLabel.frame = CGRect(x:10, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
                
    }
    
}

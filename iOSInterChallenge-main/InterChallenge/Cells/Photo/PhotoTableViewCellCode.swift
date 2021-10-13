//
//  PhotoTableViewCellCodeTableViewCell.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

class PhotoTableViewCellCode: UITableViewCell {
    
    static let identifier = "CustomTableViewCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .orange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  UserTableViewCellCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCellCode: UITableViewCell {

    static let identifier = "UserTableViewCell"
    var id = Int()
    var delegate: UserTableViewCellDelegate?
    
    public let postsButton : UIButton = {
        let button = UIButton()
        button.setTitle("POSTAGENS", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
    public let albumsButton : UIButton = {
        let button = UIButton()
        button.setTitle("ÁLBUNS", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        return button
    }()
    
   
    
    public let initialsLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 21, weight: .medium)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let nameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let userNameLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let emailLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let phoneLabel : UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(postsButton)
        contentView.addSubview(albumsButton)
        contentView.addSubview(initialsLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(phoneLabel)
        
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        
        albumsButton.addTarget(self, action: #selector(didTapAlbumsButton), for: .touchUpInside)
        
    }
    
    @objc private func didTapPostsButton(){
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
        print("posts")
    }
    
    @objc private func didTapAlbumsButton(){
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()

        initialsLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        nameLabel.frame = CGRect(x: 10, y: 60, width: contentView.frame.size.width, height: contentView.frame.size.height)
        userNameLabel.frame = CGRect(x: 160, y: 0, width: contentView.frame.size.width, height: contentView.frame.size.height)
        emailLabel.frame = CGRect(x: 160, y: 30, width: contentView.frame.size.width, height: contentView.frame.size.height)
        phoneLabel.frame = CGRect(x: 160, y: 60, width: contentView.frame.size.width, height: contentView.frame.size.height)
        postsButton.frame = CGRect(x: 100, y: 80, width: contentView.frame.size.width, height: contentView.frame.size.height)
        albumsButton.frame = CGRect(x: 0, y: 80, width: contentView.frame.size.width/2, height: contentView.frame.size.height)
    }

}

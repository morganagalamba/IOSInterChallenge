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
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("POSTAGENS", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 15)
        return button
    }()
    
    public let albumsButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("ÁLBUNS", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.titleLabel?.font = UIFont(name: "System", size: 15)
        return button
    }()
    
    public let initialsLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemYellow
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .center
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        return label
    }()
    
    public let initialsBackground : UIView = {
        let background = UIView()
        background.translatesAutoresizingMaskIntoConstraints = false
        background.backgroundColor = .systemYellow
        return background
    }()
    
    public let nameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.textAlignment = .center
        label.baselineAdjustment = .alignCenters
        label.lineBreakMode = .byTruncatingTail
        label.autoresizesSubviews = true
        
        return label
    }()
    
    let separator : UIView = {
        let div = UIView()
        div.translatesAutoresizingMaskIntoConstraints = false
        div.backgroundColor = .lightGray
        return div
    }()
    
    public let userNameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 2
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        
        label.clipsToBounds = true
        return label
    }()
    
    public let emailLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        return label
    }()
    
    public let phoneLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        label.textAlignment = .left
        label.clearsContextBeforeDrawing = true
        label.autoresizesSubviews = true
        return label
    }()
   
    public let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16.0
        stack.alignment = .center
        stack.distribution = .fillEqually
        stack.autoresizesSubviews = true
        return stack
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        contentView.clipsToBounds = true
        contentView.addSubview(initialsBackground)
        initialsBackground.addSubview(initialsLabel)
        contentView.addSubview(nameLabel)
        contentView.addSubview(separator)
        contentView.addSubview(userNameLabel)
        contentView.addSubview(emailLabel)
        contentView.addSubview(phoneLabel)
        
        buttonStackView.addArrangedSubview(albumsButton)
        buttonStackView.addArrangedSubview(postsButton)
        contentView.addSubview(buttonStackView)
        
        postsButton.addTarget(self, action: #selector(didTapPostsButton), for: .touchUpInside)
        
        albumsButton.addTarget(self, action: #selector(didTapAlbumsButton), for: .touchUpInside)
        
        setupConstraints()
    }
    
    @objc private func didTapPostsButton(){
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }
    
    @objc private func didTapAlbumsButton(){
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    private func setupConstraints(){
        
        NSLayoutConstraint.activate([
            initialsBackground.heightAnchor.constraint(equalToConstant: 88),
            initialsBackground.widthAnchor.constraint(equalToConstant: 88),
            initialsBackground.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            initialsBackground.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16)
        ])
        
        
        NSLayoutConstraint.activate([
            initialsLabel.heightAnchor.constraint(equalToConstant: 88),
            initialsLabel.widthAnchor.constraint(equalToConstant: 88),
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: initialsBackground.bottomAnchor,constant: 16),
        ])
        
        
        NSLayoutConstraint.activate([
            separator.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 32),
            separator.leadingAnchor.constraint(equalTo: initialsBackground.trailingAnchor, constant: 32),
            separator.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            separator.widthAnchor.constraint(equalToConstant: 2),
            separator.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: -24)
        ])
        
        
      NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: separator.leadingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: separator.leadingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            buttonStackView.topAnchor.constraint(equalTo: separator.bottomAnchor, constant: 24),
            buttonStackView.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 64),
            buttonStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            buttonStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            buttonStackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8 )
            
        ])

    }

}

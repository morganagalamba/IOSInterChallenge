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
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = true
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        return label
    }()
    
    public let nameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = true
        label.numberOfLines = 2
        label.contentMode = .center
        label.baselineAdjustment = .alignBaselines
        label.lineBreakMode = .byTruncatingTail
        return label
    }()
    
    let separator : UIView = {
        let div = UIView()
        div.translatesAutoresizingMaskIntoConstraints = true
        div.backgroundColor = .lightGray
        
        return div
    }()
    
    public let userNameLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 2
        //label.contentMode = .center
        label.baselineAdjustment = .alignBaselines
        label.clipsToBounds = true
        return label
    }()
    
    public let emailLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let phoneLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.numberOfLines = 500
        label.clipsToBounds = true
        return label
    }()
    
    public let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16.0
        stack.alignment = .fill
        stack.distribution = .fillEqually
        return stack
    }()
    
    public let nameStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 16.0
        stack.alignment = .center
        stack.distribution = .equalSpacing
        return stack
    }()
    
    public let userStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16.0
        stack.alignment = .fill
        return stack
    }()
    
    public let buttonStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.spacing = 16.0
  
        stack.alignment = .center
        return stack
    }()
    
    public let viewStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        //stack.spacing = 16.0
        //stack.alignment = .center
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.translatesAutoresizingMaskIntoConstraints = true
        
        nameStackView.addArrangedSubview(initialsLabel)
        nameStackView.addArrangedSubview(nameLabel)
        contentView.addSubview(nameStackView)
        
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(emailLabel)
        stackView.addArrangedSubview(phoneLabel)
        contentView.addSubview(stackView)
        userStackView.addArrangedSubview(nameStackView)
        userStackView.addArrangedSubview(separator)
        userStackView.addArrangedSubview(stackView)
        contentView.addSubview(userStackView)
        buttonStackView.addArrangedSubview(postsButton)
        buttonStackView.addArrangedSubview(albumsButton)
        contentView.addSubview(buttonStackView)
        viewStackView.addArrangedSubview(userStackView)
        viewStackView.addArrangedSubview(buttonStackView)
        contentView.addSubview(viewStackView)
        
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
            initialsLabel.heightAnchor.constraint(equalToConstant: 88),
            initialsLabel.widthAnchor.constraint(equalTo: initialsLabel.heightAnchor),
            initialsLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 16),
            initialsLabel.topAnchor.constraint(equalTo: contentView.topAnchor,constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            nameLabel.topAnchor.constraint(equalTo: initialsLabel.bottomAnchor,constant: 16)
        ])
        
        
        NSLayoutConstraint.activate([
            separator.widthAnchor.constraint(equalToConstant: 1),
            separator.bottomAnchor.constraint(equalTo: buttonStackView.topAnchor, constant: 24)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            userNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            userNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            emailLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.leadingAnchor.constraint(equalTo: separator.trailingAnchor, constant: 16),
            phoneLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])

    }

}

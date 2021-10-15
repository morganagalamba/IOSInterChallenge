//
//  DetailsViewControllerCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 12/10/21.
//

import UIKit

class DetailsViewControllerCode: UIViewController {
    
    var photo = UIImage()
    var name = String()
    
    var photoTitle = UILabel()
    var imageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = true
        navigationItem.title = "Detalhes"

        photoTitle.text = name
        photoTitle.font = .systemFont(ofSize: 17, weight: .regular)
        photoTitle.translatesAutoresizingMaskIntoConstraints = false
        photoTitle.numberOfLines = 5
        photoTitle.baselineAdjustment = .alignBaselines
        photoTitle.lineBreakMode = .byTruncatingTail
        photoTitle.clipsToBounds = true
        photoTitle.contentMode = .left
        photoTitle.autoresizesSubviews = true
  
        
        imageView = UIImageView(image: photo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        //imageView.frame = CGRect(x: 0, y: 0, width: 250, height: 250)
        

        view.addSubview(imageView)
        view.addSubview(photoTitle)
        setupConstraints()
    }
    
    private func setupConstraints(){
        let safeArea = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
            imageView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            imageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            imageView.bottomAnchor.constraint(equalTo: photoTitle.topAnchor ,constant: 16),
            imageView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 16),
 
        ])
        
        NSLayoutConstraint.activate([
            photoTitle.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -24),
            photoTitle.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 24),
            photoTitle.topAnchor.constraint(equalTo: imageView.bottomAnchor ,constant: 16)
        ])
        
        imageView.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        imageView.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        imageView.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        imageView.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
        
        photoTitle.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        photoTitle.setContentHuggingPriority(.init(rawValue: 251), for: .horizontal)
        photoTitle.setContentCompressionResistancePriority(.init(rawValue: 750), for: .vertical)
        photoTitle.setContentCompressionResistancePriority(.init(rawValue: 750), for: .horizontal)
    }
}

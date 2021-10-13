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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let photoTitle = UILabel()
        photoTitle.text = name
        photoTitle.textColor = .black
        photoTitle.frame = CGRect(x: 50, y: 420, width: 300, height: 20)
        
        let imageView = UIImageView(image: photo)
        imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 300)
        

        view.addSubview(imageView)
        view.addSubview(photoTitle)
    }
}

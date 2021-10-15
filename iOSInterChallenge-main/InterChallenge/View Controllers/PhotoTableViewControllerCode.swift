//
//  PhotoTableViewControllerCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//

import Alamofire
import UIKit

class PhotoTableViewControllerCode: UITableViewController {
    
    var albumId = Int()
    var userName = String()
    var photos = [Photo]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Fotos de \(userName)"
        tableView.register(PhotoTableViewCellCode.self, forCellReuseIdentifier: PhotoTableViewCellCode.identifier)
        fillPhotos(from: albumId)
    }
    
    private func fillPhotos(from albumId: Int) {
        AF.request("https://jsonplaceholder.typicode.com/photos?albumId=\(albumId)").validate().responseJSON { response in
            guard response.error == nil else {
                let alert = UIAlertController(title: "Erro", message: "Algo errado aconteceu. Tente novamente mais tarde.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { _ in
                    alert.dismiss(animated: true)
                }))
                self.present(alert, animated: true)
                return
            }
            
            do {
                if let data = response.data {
                    let models = try JSONDecoder().decode([Photo].self, from: data)
                    self.photos = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCellCode.identifier, for: indexPath) as? PhotoTableViewCellCode else {
            return UITableViewCell()
        }

        let photo = photos[indexPath.row]
        cell.myLabel.text = photo.title
        
        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.myImageView.image = UIImage(data: data)
            default:
                break
            }
        }
        
        return cell
    }
    
   
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        AF.download(photo.url).responseData { response in
            switch response.result {
            case .success(let data):
                let rootVC = DetailsViewControllerCode()
                rootVC.photo = UIImage(data: data)!
                rootVC.name = photo.title
                
                self.navigationController?.pushViewController(rootVC, animated: true)

            default:
                break
            }
        }
    }
    
}


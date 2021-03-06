//
//  PostTableViewControllerCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//
import Alamofire
import UIKit

class PostTableViewControllerCode: UITableViewController {
    
    var userId = Int()
    var userName = String()
    var posts = [Post]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Postagens de \(userName)"
        tableView.backgroundColor = .white
        tableView.register(TitleAndDescriptionTableViewCellCode.self, forCellReuseIdentifier: TitleAndDescriptionTableViewCellCode.identifier)
        fillPosts(from: userId)
    }
    
    private func fillPosts(from userId: Int) {
        AF.request("https://jsonplaceholder.typicode.com/posts?userId=\(userId)").validate().responseJSON { response in
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
                    let models = try JSONDecoder().decode([Post].self, from: data)
                    self.posts = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TitleAndDescriptionTableViewCellCode.identifier, for: indexPath) as? TitleAndDescriptionTableViewCellCode else {
            return UITableViewCell()
        }

        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.body
        
       
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = posts[indexPath.row].id
        
        let rootVC = CommentTableViewControllerCode()
        rootVC.postId = postId
        rootVC.userName = userName
        self.navigationController?.pushViewController(rootVC, animated: true)

        
    }
    

}

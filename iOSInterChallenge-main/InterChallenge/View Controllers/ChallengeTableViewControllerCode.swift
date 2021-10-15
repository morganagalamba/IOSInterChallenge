//
//  ChallengeTableViewControllerCode.swift
//  InterChallenge
//
//  Created by Morgana Galamba on 13/10/21.
//
import Alamofire
import UIKit

class ChallengeTableViewControllerCode: UITableViewController {
    
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Desafio"
        tableView.register(UserTableViewCellCode.self, forCellReuseIdentifier: UserTableViewCellCode.identifier)
        fillUsers()
    }
    
    private func fillUsers() {
        AF.request("https://jsonplaceholder.typicode.com/users").validate().responseJSON { response in
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
                    let models = try JSONDecoder().decode([User].self, from: data)
                    self.users = models
                    self.tableView.reloadData()
                }
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserTableViewCellCode.identifier, for: indexPath) as? UserTableViewCellCode else {
            return UITableViewCell()
        }
        let user = users[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id
        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.contentView.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
    }

}

extension ChallengeTableViewControllerCode: UserTableViewCellDelegate {
    func didTapAlbums(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        let rootVC = AlbumTableViewControllerCode()
        rootVC.userId = userIdAndName.id
        rootVC.userName = userIdAndName.name
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        let userIdAndName = (id: userId, name: name)
        let rootVC = PostTableViewControllerCode()
        rootVC.userId = userIdAndName.id
        rootVC.userName = userIdAndName.name
        self.navigationController?.pushViewController(rootVC, animated: true)
    }
}

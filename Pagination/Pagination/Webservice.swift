//
//  Webservice.swift
//  Pagination
//
//  Created by Naseem Oyebola on 11/05/2022.
//

import Foundation

class Webservice {
    func fetchUsers(page: Int, completion: @escaping (([User]) -> ())) {
        let url = URL(string: "https://giddy-tower.glitch.me/users?page=\(page)")!
        
        URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data {
                let users = try? JSONDecoder().decode([User].self, from: data)
                DispatchQueue.main.async {
                   completion(users!)
                }
            }
        }.resume()
    }
}

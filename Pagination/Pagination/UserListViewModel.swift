//
//  UserListViewModel.swift
//  Pagination
//
//  Created by Naseem Oyebola on 11/05/2022.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users = [UserViewModel]()
    
    init() {
        Webservice().fetchUsers(page: 1) { [weak self] users in
            self?.users = users.map(UserViewModel.init)
        } 
    }
    
    func nextPage(page: Int) {
        Webservice().fetchUsers(page: page) { [weak self] users in
            self?.users = users.map(UserViewModel.init)
        }
    }
}


class UserViewModel {
    var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var name: String {
        return self.user.name
    }
}

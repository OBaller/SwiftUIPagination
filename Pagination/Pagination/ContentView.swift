//
//  ContentView.swift
//  Pagination
//
//  Created by Naseem Oyebola on 11/05/2022.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var userListVM = UserListViewModel()
    @State private var page = 1
    var body: some View {
        NavigationView {
            List {
                Section() {
                    ForEach(self.userListVM.users, id: \.name) { usersVM in
                        Text(usersVM.name)
                    }
                    
                    Section() {
                        HStack {
                            Button {
                                self.page -= 1
                                self.userListVM.nextPage(page: self.page)
                            } label: {
                                Text("Previous")
                                    .foregroundColor(.blue)
                            }
                            Spacer()
                            Button{
                                self.page += 1
                                self.userListVM.nextPage(page: self.page)
                            } label: {
                                Text("Next")
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                }
            }
            .navigationTitle("User List")
            .navigationBarItems(leading: self.page > 1 ?
                                Button("Previous") {
                self.page -= 1
                self.userListVM.nextPage(page: self.page)
            } : nil , trailing: self.page == 5 ? nil : Button("Next") {
                self.page += 1
                self.userListVM.nextPage(page: self.page)
            })
            .listStyle(.plain)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


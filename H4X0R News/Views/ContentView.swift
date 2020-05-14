//
//  ContentView.swift
//  H4X0R News
//
//  Created by Arinze Anakor on 14/05/2020.
//  Copyright © 2020 ZestMade. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView{
            
            List(networkManager.posts) { post in
                
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
                
                
            }.navigationBarTitle("H4X0R NEWS")
            
        }.onAppear {
            DispatchQueue.main.async {
                self.networkManager.fetchData()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

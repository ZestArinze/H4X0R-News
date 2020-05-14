//
//  NetworkManager.swift
//  H4X0R News
//
//  Created by Arinze Anakor on 14/05/2020.
//  Copyright © 2020 ZestMade. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject {
    
    @Published var posts = [Post]()

    func fetchData() {
        if let url = URL(string: "https://hn.algolia.com/api/v1/search?tags=front_page") {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) {(data, response, error) in
                
                if let e = error {
                    print("Error has occured: \(e)")
                    return
                }
                
                let decoder = JSONDecoder()
                
                if let safeData = data {
                    do {
                        let results = try decoder.decode(Results.self, from: safeData)
                        DispatchQueue.main.async {
                            self.posts = results.hits
                        }
                    } catch {
                        print(error)
                    }
                }
            }
            
            task.resume()
        }
    }
}

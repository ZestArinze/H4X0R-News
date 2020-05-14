//
//  PostData.swift
//  H4X0R News
//
//  Created by Arinze Anakor on 14/05/2020.
//  Copyright © 2020 ZestMade. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String { // computed property
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}

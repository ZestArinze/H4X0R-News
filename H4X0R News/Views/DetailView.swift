//
//  DetailView.swift
//  H4X0R News
//
//  Created by Arinze Anakor on 14/05/2020.
//  Copyright © 2020 ZestMade. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://wwww.google.com")
    }
}




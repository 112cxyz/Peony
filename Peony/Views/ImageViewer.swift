//
//  ImageViewer.swift
//  Peony
//
//  Created by Toby Fox on 31/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct ImageViewer: View {
    var image: URL
    var body: some View {
        
        NavigationView{
            VStack{
                ScrollView{
                    WebImage(url:image)
                        .resizable()
                        .scaledToFill()
                        .clipped()
                        .contextMenu {
                            Button(action: {
                                try! UIPasteboard.general.url = image
                            }) {
                                Text("Copy to clipboard")
                                Image(systemName: "doc.on.doc")
                            }
                        }
                }
            }
        }
    }
}

struct ImageViewer_Previews: PreviewProvider {
    static var previews: some View {
        ImageViewer(image: URL(string: "https://i.waifu.pics/kBYBvIP.jpg")!)
    }
}

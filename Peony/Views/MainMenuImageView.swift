//
//  MainMenuImageView.swift
//  Peony
//
//  Created by Toby Fox on 01/11/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct MainMenuImageView: View {
    var files: URL
    var body: some View {
        VStack{
            WebImage(url:files)
                .resizable()
                .scaledToFill()
                .clipped()
                .contextMenu {
                    Button(action: {
                        try! UIPasteboard.general.url = files
                    }) {
                        Text("Copy to clipboard")
                        Image(systemName: "doc.on.doc")
                    }
                }
        }
    }
}

struct MainMenuImageView_Previews: PreviewProvider {
    static var previews: some View {
        MainMenuImageView(files: URL(string: "https://i.waifu.pics/kBYBvIP.jpg")!)
    }
}

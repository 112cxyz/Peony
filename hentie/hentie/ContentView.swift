//
//  ContentView.swift
//  hentie
//
//  Created by Toby Fox on 24/07/2022.
//

import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct response: Codable {
    let url: String
}


struct ContentView: View {
    @State var issue = false
    @State var msg = ""
    @State var url = URL(string: "https://i.waifu.pics/cKe~bpZ.jpg")
    var body: some View {
        List {
            WebImage(url: url)
                .resizable()
                .scaledToFit()
            
        }
        .task {
            await getImage()
        }
        .refreshable {
            Task { await getImage() }
        } 
    }
    
    func getImage() async -> Void {
        do {
            let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.waifu.pics/sfw/waifu")!)
            let json = try JSONDecoder()
                .decode(response.self, from: data)
            let photourl = URL(string: json.url)
            url = photourl
        } catch {
            print(error)
            msg = error.localizedDescription
            issue = true
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



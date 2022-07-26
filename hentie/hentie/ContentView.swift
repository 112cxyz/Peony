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
    @State var nsfwtoggle = false
    @State var category = "Category: Waifu"
    var body: some View {
        List {
            Text("need to name it")
                .font(.largeTitle)
                .multilineTextAlignment(.leading)
            Text(category)
            WebImage(url: url)
                .resizable()
                .scaledToFit()
            Link(destination: url!) {
                Text("Source Image")
            }
                Button("Refresh") {
                Task { await getImage() }
            }

                Button("Toggle NSFW")
                {
                    if nsfwtoggle == false {
                        nsfwtoggle = true
                    }
                    else {
                        nsfwtoggle = false
                    }
                    Task { await getImage() }
                }
            VStack {
                Text("not here")
            }
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
            if nsfwtoggle {
                let randomInt = Int.random(in: 1..<3)
                if randomInt == 2 {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.waifu.pics/nsfw/waifu")!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Waifu"
                }
                else {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.waifu.pics/nsfw/neko")!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Neko"
                }
                
            }
            else {
                let catgornum = Int.random(in: 1..<14)
                if catgornum == 1 {
                    let catgorurl = "https://api.waifu.pics/sfw/waifu"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Waifu"
                }
                if catgornum == 2 {
                    let catgorurl = "https://api.waifu.pics/sfw/neko"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Neko"
                }
                if catgornum == 3 {
                    let catgorurl = "https://api.waifu.pics/sfw/shinobu"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Shinobu"
                }
                if catgornum == 4 {
                    let catgorurl = "https://api.waifu.pics/sfw/megumin"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Megumin💥"
                }
                if catgornum == 5 {
                    let catgorurl = "https://api.waifu.pics/sfw/handhold"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Handholding"
                }
                if catgornum == 6 {
                    let catgorurl = "https://api.waifu.pics/sfw/cuddle"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Cuddle"
                }
                if catgornum == 7 {
                    let catgorurl = "https://api.waifu.pics/sfw/cry"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Cry"
                }
                if catgornum == 8 {
                    let catgorurl = "https://api.waifu.pics/sfw/hug"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Hug"
                }
                if catgornum == 9 {
                    let catgorurl = "https://api.waifu.pics/sfw/awoo"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Awoo"
                }
                if catgornum == 10 {
                    let catgorurl = "https://api.waifu.pics/sfw/kiss"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Kiss"
                }
                if catgornum == 11 {
                    let catgorurl = "https://api.waifu.pics/sfw/lick"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Lick"
                }
                if catgornum == 12 {
                    let catgorurl = "https://api.waifu.pics/sfw/pat"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Pat"
                }
                if catgornum == 12 {
                    let catgorurl = "https://api.waifu.pics/sfw/smug"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Smug"
                }
                if catgornum == 13 {
                    let catgorurl = "https://api.waifu.pics/sfw/bonk"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Bonk"
                }
                
                
                

            }

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
            .toolbar {
                ToolbarItemGroup(placement: .bottomBar) {
                    Button("First") {
                        print("Pressed")
                    }

                    Button("Second") {
                        print("Pressed")
                    }
                }
    }
    }
}



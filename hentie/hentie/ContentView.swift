//
//  ContentView.swift
//  Peony
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
    @State var megumin = ""
    @State var forcedsubject = ""
    var body: some View {
        VStack {

        List {
            Text("Peony")
                .font(.title)
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


        }
            .task {
                await getImage()
                }
            .refreshable {
                Task { await getImage() }
                }

            VStack {
                HStack {
                    Text("Made by 112c")
                        .multilineTextAlignment(.leading)
                        .padding(.leading, 4.0)
                    Spacer()
                    Text(megumin).font(.caption)
                        Menu {
                        Button ("Show 18+")
                        {
                            if nsfwtoggle == false {
                                nsfwtoggle = true
                            }
                            else {
                                nsfwtoggle = false
                            }
                            Task { await getImage() }
                        }
                        }label: {
                            Label("", systemImage: "gear")
                        }
                }
                .padding(.bottom, 0.8)
                
                }
        
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
                    megumin = ""
                }
                else {
                    let (data, _) = try await URLSession.shared.data(from: URL(string: "https://api.waifu.pics/nsfw/neko")!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Neko"
                    megumin = ""
                }
                
            }
            else {
                let catgornum = Int.random(in: 1..<15)
                if catgornum == 1 {
                    let catgorurl = "https://api.waifu.pics/sfw/waifu"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Waifu"
                    megumin = ""
                }
                if catgornum == 2 {
                    let catgorurl = "https://api.waifu.pics/sfw/neko"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Neko"
                    megumin = ""
                }
                if catgornum == 3 {
                    let catgorurl = "https://api.waifu.pics/sfw/shinobu"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Shinobu"
                    megumin = "arawagi, oops i fwubbed"
                }
                if catgornum == 4 {
                    let catgorurl = "https://api.waifu.pics/sfw/megumin"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Megumin💥"
                    megumin = "Explosion Magic!"
                }
                if catgornum == 5 {
                    let catgorurl = "https://api.waifu.pics/sfw/handhold"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Handholding"
                    megumin = ""
                }
                if catgornum == 6 {
                    let catgorurl = "https://api.waifu.pics/sfw/cuddle"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Cuddle"
                    megumin = ""
                }
                if catgornum == 7 {
                    let catgorurl = "https://api.waifu.pics/sfw/cry"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Cry"
                    megumin = ""
                }
                if catgornum == 8 {
                    let catgorurl = "https://api.waifu.pics/sfw/hug"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Hug"
                    megumin = ""
                }
                if catgornum == 9 {
                    let catgorurl = "https://api.waifu.pics/sfw/awoo"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Awoo"
                    megumin = ""
                }
                if catgornum == 10 {
                    let catgorurl = "https://api.waifu.pics/sfw/kiss"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Kiss"
                    megumin = ""
                }
                if catgornum == 11 {
                    let catgorurl = "https://api.waifu.pics/sfw/lick"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Lick"
                    megumin = ""
                }
                if catgornum == 12 {
                    let catgorurl = "https://api.waifu.pics/sfw/pat"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Pat"
                    megumin = ""
                }
                if catgornum == 13 {
                    let catgorurl = "https://api.waifu.pics/sfw/smug"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Smug"
                    megumin = ""
                }
                if catgornum == 14 {
                    let catgorurl = "https://api.waifu.pics/sfw/bonk"
                    let (data, _) = try await URLSession.shared.data(from: URL(string: catgorurl)!)
                    let json = try JSONDecoder()
                        .decode(response.self, from: data)
                    let photourl = URL(string: json.url)
                    url = photourl
                    category = "Category: Bonk"
                    megumin = ""
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
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
    }
}



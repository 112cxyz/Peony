//
//  ContentView.swift
//  Peony
//
//  Created by Toby Fox on 31/10/2022.
//

import SwiftUI

class Settings: ObservableObject {
    @Published var catagory = "waifu"
    @Published var nsfw = false
    @Published var files: [URL] = [URL(string: "https://i.waifu.pics/Fiw2pVa.jpg")!,URL(string: "https://i.waifu.pics/E4jszNV.jpeg")!,URL(string: "https://i.waifu.pics/vwRNvPe.jpg")!,URL(string: "https://i.waifu.pics/G8JK8lu.png")!,URL(string: "https://i.waifu.pics/3x8hEE1.png")!,URL(string: "https://i.waifu.pics/PQO5wPN.jpg")!,URL(string: "https://i.waifu.pics/Fs1hUxz.jpg")!,URL(string: "https://i.waifu.pics/5DWHrk_.png")!,URL(string: "https://i.waifu.pics/8TL6ycS.jpg")!,URL(string: "https://i.waifu.pics/CwK185b.jpg")!,URL(string: "https://i.waifu.pics/JREnutK.png")!,URL(string: "https://i.waifu.pics/4eSVOil.jpg")!,URL(string: "https://i.waifu.pics/KR6ij69.jpg")!,URL(string: "https://i.waifu.pics/cu~8th-.jpg")!,URL(string: "https://i.waifu.pics/mUTwf4z.jpg")!,URL(string: "https://i.waifu.pics/S0v1yqP.jpeg")!,URL(string: "https://i.waifu.pics/jiHthY6.png")!,URL(string: "https://i.waifu.pics/i~n9IEk.jpg")!,URL(string: "https://i.waifu.pics/5tN4N4D.jpg")!,URL(string: "https://i.waifu.pics/KfZyMS3.jpg")!,URL(string: "https://i.waifu.pics/8pUgW9x.png")!,URL(string: "https://i.waifu.pics/2qfjhSP.jpg")!,URL(string: "https://i.waifu.pics/KcrOIYV.jpg")!,URL(string: "https://i.waifu.pics/aGgUm80.jpg")!,URL(string: "https://i.waifu.pics/slz3yPL.png")!,URL(string: "https://i.waifu.pics/wt2ZmoY.png")!,URL(string: "https://i.waifu.pics/AR-NLDr.png")!,URL(string: "https://i.waifu.pics/POqiwlb.jpg")!,URL(string: "https://i.waifu.pics/~ccKs1-.jpg")!,URL(string: "https://i.waifu.pics/KJnKOgU.jpg")!]
}

struct ContentView: View {
    @StateObject var setting = Settings()
    @State var nsfwsort = 0
    @State var sfwsort = 0
    var nsfwoptions: [String] = ["waifu","neko","trap","blowjob"]
    var sfwoptions: [String] = ["waifu","neko","shinobu","megumin","cuddle","hug","cry","kiss","smug"]
                                
    var body: some View {
        NavigationView{
            ScrollView{
                Spacer()
                MainMenuImageView(files: setting.files[0])
            }.refreshable {
                await getImage(catgor: setting.catagory, nsfw: setting.nsfw)
            }
            .navigationViewStyle(.stack)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    HStack {
                        Spacer()
                        Text("Peony")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                        Spacer()
                        Menu {
                            Text("Catagory")
                            if setting.nsfw{
                                Picker(selection: $nsfwsort, label: Text("Sorting options")){
                                    Text("Waifu").tag(0)
                                    Text("Neko").tag(1)
                                    Text("Trap").tag(2)
                                    Text("Blowjob").tag(3)
                                }.onChange(of: nsfwsort){ value in
                                    setting.catagory = nsfwoptions[nsfwsort]
                                    Task {
                                        await getImage(catgor: setting.catagory, nsfw: setting.nsfw)
                                    }
                                }
                                
                            }
                            if setting.nsfw == false {
                                    Picker(selection: $sfwsort, label: Text("Sorting options")){
                                        Text("Waifu").tag(0)
                                        Text("Neko").tag(1)
                                        Text("Shinobu").tag(2)
                                        Text("Megumin").tag(3)
                                        Text("Cuddle").tag(4)
                                        Text("Cry").tag(5)
                                        Text("Hug").tag(6)
                                        Text("Kiss").tag(7)
                                        Text("Smug").tag(8)
                                    }.onChange(of: sfwsort){value in
                                        setting.catagory = sfwoptions[sfwsort]
                                        Task {
                                            await getImage(catgor: setting.catagory, nsfw: setting.nsfw)
                                        }
                                    }
                                
                                }
                            
                        
                        } label:{Image(systemName: "line.3.horizontal")}
                        
                        NavigationLink(destination: ImageView()) {
                            Image(systemName: "square.grid.2x2")
                            
                        }
                        
                        NavigationLink(destination: ImageMenuView()) {
                            Image(systemName: "rectangle.grid.1x2")
                            
                        }
                        NavigationLink(destination: SettingsView()) {
                            Image(systemName: "gear")
                        }
                    }
                }
            }
        }.environmentObject(setting)
            .navigationViewStyle(.stack)

    }
    func getImage(catgor: String,nsfw: Bool) async -> Void {
        let baseurl = URL(string: "https://api.waifu.pics/many/")!
        if nsfw{
            var url = URL(string: "\(baseurl)nsfw/\(catgor)")!
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            
            let exclusion = """
            {
                "files": []
            }
            """
            req.httpBody = exclusion.data(using: .utf8)

            do {
                let (data, res) = try! await URLSession.shared.data(for: req)
                
                let json = try JSONDecoder()
                    .decode(response.self, from: data)
                setting.files = json.files
            }catch{
                print("oops")
            }
            
        }else{
            var url = URL(string: "\(baseurl)sfw/\(catgor)")!
            var req = URLRequest(url: url)
            req.httpMethod = "POST"
            
            let exclusion = """
            {
                "files": []
            }
            """
            req.httpBody = exclusion.data(using: .utf8)

            do {
                let (data, res) = try! await URLSession.shared.data(for: req)
                
                let json = try JSONDecoder()
                    .decode(response.self, from: data)
                setting.files = json.files
        
        
        

            }catch{
                print("oops")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

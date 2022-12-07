//
//  ImageView.swift
//  Peony
//
//  Created by Toby Fox on 31/10/2022.
//

import SwiftUI
import SDWebImageSwiftUI
import SDWebImage

struct response: Codable{
    var files: Array<URL>
}



struct ImageView: View {
    @EnvironmentObject var setting: Settings
    
    var body: some View {
        
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))], spacing: 1){
                ForEach(setting.files, id: \.self) { files in
                    NavigationLink(destination: ImageViewer(image: files)) {
                        Rectangle()
                            .fill(
                                LinearGradient(gradient: Gradient(colors: [.black, .gray]), startPoint: .top, endPoint: .bottom)
                            )
                            .aspectRatio(1, contentMode: .fit)
                            .overlay(
                                WebImage(url:files)
                                    .resizable()
                                    .scaledToFill()
                                    .aspectRatio(1, contentMode: .fit)
                                    .clipped()
                            )
                            .clipShape(Rectangle())
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
        }
        .refreshable {
            await getImage(catgor: setting.catagory, nsfw: setting.nsfw)
        }
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

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}

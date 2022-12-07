//
//  SettingsView.swift
//  Peony
//
//  Created by Toby Fox on 31/10/2022.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var setting: Settings
    var body: some View {
        NavigationView{
            VStack{
                List{
                    Toggle(isOn: $setting.nsfw ) {
                        Text("NSFW Content (18+)")
                    }.onChange(of: setting.nsfw) { value in
                        Task {
                            await getImage(catgor: setting.catagory, nsfw: setting.nsfw)
                        }
                    }
                }.listStyle(GroupedListStyle())
                
            }
            .navigationTitle("Settings")
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

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}

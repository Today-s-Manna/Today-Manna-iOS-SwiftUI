//
//  ContentView.swift
//  EverydayManna
//
//  Created by KimJinyeob on 2021/01/07.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        Text("Hello, world!")
            .padding()
        
    }
    init(){
        callMovieAPI()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

func callMovieAPI() {
        let url = "http://3.138.184.130:9179/api/v1/today-manna"

        let apiURL: URL! = URL(string: url)
    
        let apidata = try! Data(contentsOf: apiURL)
    
        let log = NSString(data: apidata, encoding: String.Encoding.utf8.rawValue) ?? "데이터가 없습니다"
        NSLog("API Result=\( log )")

        do {

            let apiDictionary = try JSONSerialization.jsonObject(with: apidata, options: []) as! NSDictionary

            let verse = apiDictionary["verse"] as! String

            let contents = apiDictionary["contents"] as! [String]

            var contentString = ""
            
            let manna = MannaVO()

            for content in contents {
                
                let r = content as String;
                
                contentString.append(r)
            }
            manna.contents = contentString
            manna.verse=verse

        }catch { NSLog("Parse Error!!")}

    }

    

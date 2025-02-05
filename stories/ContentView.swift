//
//  ContentView.swift
//  stories
//
//  Created by Mert Akçay on 5.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack{
            LeftSubview(iconFlag: "modern")
            
            RightSubview(iconFlag: "modern")

            
        }
    }
}

#Preview {
    ContentView()
}

struct LeftSubview: View {
    let iconFlag:String
    var icon:String {
        if iconFlag == "classic" {
            return "globe"
        }
        else {
            return "globe.americas"
        }
        
    }
    
    var body: some View {
        VStack {
            Image(systemName:icon)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Hello, world!")
                .padding()
            Text("Who is ")
                .padding()
            Text("\(iconFlag)")
                .padding()
        }
        .padding()
    }
}

struct RightSubview: View {
    let iconFlag:String
    var icon:String {
        if iconFlag == "classic" {
            return "globe"
        }
        else {
            return "globe.americas"
        }
        
    }

    var body: some View {
        VStack {
            Image(systemName: icon)
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Hello, world!")
                .padding()
            Text("Who is ")
                .padding()
            Text("\(iconFlag)")
                .padding()
        }
        .padding()
    }
}

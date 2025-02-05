//
//  ContentView.swift
//  stories
//
//  Created by Mert Akçay on 5.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
        .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.green]), startPoint: .topLeading, endPoint: .bottomTrailing))

}

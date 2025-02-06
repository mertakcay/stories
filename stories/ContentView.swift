//
//  ContentView.swift
//  stories
//
//  Created by Mert Akçay on 5.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var storyDescription: String = ""
    @State private var selectedTab = 1  // Changed back to 1 for Create view as initial screen
    @State private var showingPopup = false
    
    var body: some View {
        ZStack {
            Color.kidsPalette.background
                .ignoresSafeArea()
            
            VStack {
                // Show different views based on selected tab
                switch selectedTab {
                case 0:
                    HomeView()
                case 1:
                    CreateView(storyDescription: $storyDescription)
                case 2:
                    Text("Profile View")
                        .font(.title)
                default:
                    EmptyView()
                }
                
                BottomNavBar(selectedTab: $selectedTab, showPopup: $showingPopup)
            }
            
            if showingPopup {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .onTapGesture {
                        showingPopup = false
                    }
                
                VStack {
                    Text("Hello!")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.kidsPalette.textPrimary)
                        .padding()
                }
                .frame(width: 250)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white)
                        .shadow(color: Color.kidsPalette.primary.opacity(0.2), radius: 15)
                )
                .transition(.scale)
            }
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

// Move the create view content to a separate view
struct CreateView: View {
    @Binding var storyDescription: String
    
    var body: some View {
        VStack {
            Spacer()
            Text("Write a short description \nfor good sleeping")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)
                .foregroundColor(.kidsPalette.textPrimary)
                .padding()
            
            TextEditor(text: $storyDescription)
                .frame(height: 150)
                .scrollContentBackground(.hidden)
                .font(.body)
                .padding(.horizontal, 8)
                .padding(.vertical, 12)
                .overlay(
                    ZStack(alignment: .topLeading) {
                        if storyDescription.isEmpty {
                            Text("Share your thoughts about sleeping habits...")
                                .font(.body)
                                .foregroundColor(.kidsPalette.textSecondary)
                                .padding(.horizontal, 8)
                                .padding(.vertical, 12)
                                .allowsHitTesting(false)
                        }
                    }
                )
                .padding(4)
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.kidsPalette.primary, lineWidth: 1)
                        .background(Color.white.cornerRadius(15))
                )
                .padding(.horizontal)
            
            Spacer()
        }
        .padding(15)
    }
}

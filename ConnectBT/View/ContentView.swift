//
//  ContentView.swift
//  ConnectBT
//
//  Created by tsis-Macbook Pro on 5/14/24.
//
import SwiftUI

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            ScannerView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Scan")
                }
            
            FavoritesView()
                .tabItem {
                    Image(systemName: "star")
                    Text("Favorites")
                }
            
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

#Preview {
    ContentView()
}

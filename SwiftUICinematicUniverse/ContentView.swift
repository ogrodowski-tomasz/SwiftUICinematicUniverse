//
//  ContentView.swift
//  SwiftUICinematicUniverse
//
//  Created by Tomasz Ogrodowski on 27/11/2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Home()
                .tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

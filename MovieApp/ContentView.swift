//
//  ContentView.swift
//
//  Created by Никита Костин on 12.08.2020.
//  Copyright © 2020 Никита Костин. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    var body: some View {
        TabView {
           
            MovieListView()
                .tabItem {
                    VStack {
                        Image(systemName: "tv")
                        Text("Фильмы")
                    }
            }
            .tag(0)
            
            MovieSearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Поиск")
                    }
            }
            .tag(1)
            
            AccountView()
                .tabItem{
                    VStack{
                        Image(systemName: "person.crop.circle")
                        Text("Аккаунт")
                }}
            .tag(2)
                       
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

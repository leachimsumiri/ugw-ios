//
//  ContentView.swift
//  umgottewillenios
//
//  Created by Michael Irimus on 07.10.19.
//  Copyright © 2019 Michael Irimus. All rights reserved.
//

import SwiftUI

var compose = UIImage(named: "square.and.pencil")
var composeImageView = UIImageView(image: compose)

struct ContentView: View {
    @State private var selection = 0
 
    var body: some View {
        TabView(selection: $selection){
            Text("Events")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "list.dash")
                        Text("Events")
                    }
                }
                .tag(0)
            Text("Map")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "map")
                        Text("Map")
                    }
                }
                .tag(1)
            Text("Recommend")
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "square.and.pencil")
                        Text("Recommend")
                    }
                }
                .tag(2)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  HomeSwiftUIView.swift
//  NoteScanner
//
//  Created by Sheetal  on 4/17/20.
//  Copyright © 2020 Sheetal . All rights reserved.
//

import SwiftUI


struct HomeSwiftUIView: View {
    //@State private var tabSelected = 0
    //@EnvironmentObject var userData: UserData
    
    var body: some View {
       TabView {
            Text("Home")
                .tabItem {
                    Image(systemName: "circle")
                    Text("Home")
                }
            Text("List")
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("List")
                }
            Text("Notes")
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Notes")
                }
        }
        .font(.headline)
}

struct HomeSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        HomeSwiftUIView()
    }
}
    

}



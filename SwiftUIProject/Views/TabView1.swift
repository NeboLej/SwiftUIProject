//
//  TabViewApp.swift
//  SwiftUIProject
//
//  Created by Nebo on 09.10.2022.
//

import SwiftUI

struct TabViewApp: View {
    
    @State var selectionTab = 1
    
    var body: some View {
        TabView(selection: $selectionTab) {
            View1(selectionTab: $selectionTab).tabItem {
                Image(systemName: "house.fill")
                Text("tab 1")
            }.tag(0)
            View2(selectionTab: $selectionTab).tabItem {
                Image(systemName: "globe")
                Text("tab 2")
            }.tag(1)
            View3(selectionTab: $selectionTab).tabItem {
                Image(systemName: "person.fill")
                Text("tab 3")
            }.tag(2)
        }
        .onAppear() {  UITabBar.appearance().backgroundColor = .systemPink }
        .accentColor(.green)
        .font(.headline)
    }
}

struct TabViewApp_Previews: PreviewProvider {
    static var previews: some View {
        TabViewApp()
    }
}

struct View1: View {
    
    @Binding var selectionTab: Int
    
    var body: some View {
        ZStack {
            Color.red.ignoresSafeArea(edges: .top)
            VStack {
                Text("View1").foregroundColor(Color.white)
                Button("go tab 3") {
                    selectionTab = 2
                }
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(20)
            }
        }
    }
}

struct View2: View {
    
    @Binding var selectionTab: Int
    
    var body: some View {
        ZStack {
            Color.blue.ignoresSafeArea(edges: .top)
            Text("View2").foregroundColor(Color.white)
        }
    }
}

struct View3: View {
    
    @Binding var selectionTab: Int
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea(edges: .top)
            Text("View3").foregroundColor(Color.white)
        }
    }
}

//
//  MainTabBarView.swift
//  Negm
//
//  Created by abdallah negm on 24/07/2024.

import SwiftUI

struct MainTabBarView: View {
    
    @State private var selectedTab: Int = 0
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        TabView {
            HomeView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
            
            SearchView()
                .tabItem {
                    VStack {
                        Image(systemName: "magnifyingglass")
                        Text("Search")
                    }
                }
            
            AddView2()
                .tabItem {
                    VStack {
                        Image(systemName: "plus.circle")
                        Text("Add")
                    }
                }
            
            MySearchView(viewModel: viewModel)
                .tabItem {
                    VStack {
                        Image(systemName: "star")
                        Text("My Search")
                    }
                }
            
            Text("Renting")
                .tabItem {
                    VStack {
                        Image(systemName: "car.circle.fill")
                        Text("Renting cars")
                    }
                }
                .onAppear {
                    UITabBar.appearance().backgroundColor = .white
                }
        }
    }
}

#Preview {
    MainTabBarView().tint(.brown)
}

// هنا بغيل لون التاب بار اول ما اضغط علي حاجه يتغير لونها في السطر الي فوقي علي طول

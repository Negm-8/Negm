//
//  HomeView.swift
//  Negm
//
//  Created by abdallah negm on 24/07/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                ZStack {
                    Color(.gray)
                        .ignoresSafeArea()
                    
                    VStack(spacing: 0) {
                        Spacer().frame(height: 120)
                        
                        // Ad space - large rectangle for ads
                        AdView()
                            .frame(height: 200) // Adjust height as needed
                            .padding(.horizontal)
                        
                        // Car Showrooms
                        Car_Showrooms(viewModel: viewModel)
                        
                        // Top Car View
                        
                        CarSallView()
//                    =======    CarsForSaleView(viewModel: viewModel)
                    }
                    
                  
                    Button(action: {
                        // Add button action here
                    }, label: {
                        HStack {
                            // Add button content here
                        }
                        .frame(height: 37)
                        .overlay {
                            Capsule()
                                .stroke(lineWidth: 0.9)
                                .foregroundColor(Color(.systemGray5))
                        }
                    })
                    .padding() // Add padding if needed to position the button correctly
                }
                .navigationBarItems(leading: NavigationLink(
                    destination: ProfilView(),
                    label: {
                        Image(systemName: "person.crop.circle")
                            .foregroundColor(.black)
                    }
                ))
                .navigationTitle("Home")
            }
            .background(Color.gray)
            .ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct AdView: View {
    var body: some View {
        VStack {
            // Placeholder for ad content (Image or Video)
            Text("Ad Space")
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.blue) // Change to image or video as needed
                .cornerRadius(10)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}

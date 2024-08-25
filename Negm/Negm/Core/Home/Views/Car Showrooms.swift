//
//  Car Showrooms.swift
//  Negm
//
//  Created by abdallah negm on 28/07/2024.
//في الصفحه الاساسيه ٤ بروفايل لي المعارض


import SwiftUI

struct Car_Showrooms: View {
    @StateObject private var viewModel: HomeViewModel
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack {
            HStack {
                Text("هنا اسم لي المعارض")
                    .font(.headline)
                    .fontWeight(.semibold)
                    .padding()
                Spacer()
            }
            .padding()
            .foregroundColor(.white)
            
            // Row of 4 buttons
            HStack(spacing: 20) {
                ForEach(0..<4) { index in
                    Button(action: {
                        // Add action to navigate to the profile page here
                    }) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color.white)
                            .frame(width: 80, height: 80)
                            .overlay {
                                VStack {
                                    Image(systemName: "person.circle")
                                        .resizable()
                                        .scaledToFill()
                                        .frame(width: 40, height: 40)
                                    Text("Profile \(index + 1)")
                                        .font(.footnote)
                                }
                            }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    #Preview {
        Car_Showrooms(viewModel: HomeViewModel())
    }
}

//
//  CostemCarView.swift
//  Negm
//
//  Created by abdallah negm on 30/07/2024.
//

import SwiftUI

struct CustomCarView: View {
    var index: Int
    @StateObject var viewModel: HomeViewModel
    @State private var isFavorite: Bool
    init(index: Int, viewModel: HomeViewModel) {
        self.index = index
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.isFavorite = viewModel.cars[index].isFavorite
    }
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .fill(.white)
            .frame(height: 120)
            .overlay {
                HStack(spacing: 10) {
                    Image(viewModel.cars[index].mainImageName)
                        .resizable()
                        .frame(width: 80,height: 50)
                        .scaledToFit()
                    VStack(alignment: .leading, spacing: 12) {
                        Text(viewModel.cars[index].carName)
                            .font(.footnote)
                            .fontWeight(.semibold)
                            .foregroundStyle(.black)
                        
                        Text("By \(viewModel.cars[index].hostName)")
                            .font(.footnote)
                            .foregroundStyle(.gray)
                    }
                    Spacer()
                    Button(action: {
                        isFavorite.toggle()
                    }, label: {
                        Image(systemName: isFavorite ? "star.fill" : "star")
                            .foregroundStyle(.red)
                    })
                    
                }
                .padding()
        }
    }
}

#Preview {
    CustomCarView(index: 0, viewModel: HomeViewModel())
}

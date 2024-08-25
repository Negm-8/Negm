//
//  SearchView.swift
//  Negm
//
//  Created by abdallah negm on 30/07/2024.
//



import SwiftUI

struct MySearchView: View {
    @StateObject private var viewModel: HomeViewModel
    var MySearchCars: [Car]
    init(viewModel: HomeViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.MySearchCars = viewModel.cars.filter({ $0.isFavorite == true })
    }
    var body: some View {
        NavigationStack {
            VStack {
                ForEach(MySearchCars) { car in
                    let index = viewModel.cars.firstIndex(where: {$0 == car}) ?? 0
                    CustomCarView(index: index, viewModel: viewModel)
                        .padding()
                }
                Spacer()
            }
            
            .navigationTitle("MySearch")
            .background(Color(.systemGray))
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}


#Preview {
    MySearchView(viewModel: HomeViewModel())
}

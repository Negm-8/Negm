//
//  SideMenuOptionView.swift
//  Negm
//
//  Created by abdallah negm on 06/08/2024.
//

import SwiftUI

struct SideMenuOptionView: View {
    let viewModel : ProfilViewModel
    var body: some View {
        HStack (spacing: 16) {
            Image(systemName: viewModel.imageName)
                .frame(width: 24, height: 25)
            
            Text (viewModel.title)
                .font(.system(size: 15, weight: .semibold))
            
            Spacer()
            
        }
        .foregroundColor(.white)
        .padding()
    }
}

struct SideMenuOptionView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuOptionView(viewModel: .Messages)
    }
}

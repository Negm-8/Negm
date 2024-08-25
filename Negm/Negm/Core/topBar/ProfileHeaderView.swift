//
//  ProfileHeaderView.swift
//  Negm
//
//  Created by abdallah negm on 06/08/2024.
//


import SwiftUI

struct ProfileHeaderView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Image("negm22")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 64, height: 64)
                    .clipShape(Circle())
                    .padding(.bottom, 3)
                    .padding(.trailing, 8) // إضافة فراغ بين الصورة والنص
                
                VStack(alignment: .leading) {
                    Text("Abdallah Negm")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    
                }
                Spacer()
            }
            
            Spacer()
        }
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView()
            .background(Color.black) // لتسهيل رؤية النصوص البيضاء في المعاينة
    }
}

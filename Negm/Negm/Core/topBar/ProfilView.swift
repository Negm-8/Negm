//
//  ProfilView.swift
//  Negm
//
//  Created by abdallah negm on 06/08/2024


import SwiftUI

struct ProfilView: View {
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        NavigationLink(destination: HomeView(viewModel: HomeViewModel())) {}
                        .background(Color.black.opacity(0.5)) // خلفية لزر الرجوع
                        .clipShape(Circle()) // لتصميم الزر بشكل دائري
                        .padding(.top) // تباعد من الأعلى
                        Spacer()
                    }
                    .frame(maxWidth: .infinity, alignment: .leading) // وضع الزر في أعلى اليسار
                    
                    ProfileHeaderView()
                        .frame(height: 120)
                    
                    ForEach(ProfilViewModel.allCases, id: \.self) { option in
                        
                        Button(action: {
                            // إضافة الإجراءات المطلوبة لكل زر هنا
                            print("Button \(option.rawValue + 1) tapped")
                        }) {
                            
                            SideMenuOptionView(viewModel: option)
                            
                        }
                        .padding(.vertical, 1) // تقليل المسافة العمودية بين الأزرار
                    }
                    
                    Spacer() // لتعبئة المساحة المتبقية في الأسفل
                }
                .navigationBarHidden(true)
            }
        }
    }

    struct ProfilView_Previews: PreviewProvider {
        static var previews: some View {
            ProfilView()
        }
    }
}


//import SwiftUI
//
//struct ProfilView: View {
//    var body: some View {
//        NavigationView {
//            ZStack {
//                LinearGradient(gradient: Gradient(colors: [Color.black, Color.gray]), startPoint: .top, endPoint: .bottom)
//                    .ignoresSafeArea()
//                
//                VStack {
//                    HStack {
//                        NavigationLink(destination: HomeView(viewModel: HomeViewModel())) {
//                            Image(systemName: "chevron.left") // رمز الرجوع
//                                .foregroundColor(.white)
//                                .padding()
//                        }
//                        .background(Color.black.opacity(0.5)) // خلفية لزر الرجوع
//                        .clipShape(Circle()) // لتصميم الزر بشكل دائري
//                        .padding(.top) // تباعد من الأعلى
//                        
//                        Spacer()
//                    }
//                    .frame(maxWidth: .infinity, alignment: .leading) // وضع الزر في أعلى اليسار
//                    
//                    ProfileHeaderView()
//                        .frame(height: 120)
//                    
//                    ForEach(ProfilViewModel.allCases, id: \.self) { option in
//                        Button(action: {
//                            // إضافة الإجراءات المطلوبة لكل زر هنا
//                            print("Button \(option.rawValue + 1) tapped")
//                        }) {
//                            SideMenuOptionView(viewModel: option)
//                        }
//                        .padding(.vertical, 5) // تقليل المسافة العمودية بين الأزرار
//                    }
//                    
//                    Spacer() // لتعبئة المساحة المتبقية في الأسفل
//                }
//                .navigationBarHidden(true) // إخفاء شريط التنقل
//            }
//        }
//    }
//}
//
//struct ProfilView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProfilView()
//    }
//  }
//}


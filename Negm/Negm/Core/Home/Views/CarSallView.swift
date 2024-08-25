//
//  CarSallView.swift
//  Negm
//
//  Created by abdallah negm on 25/08/2024.

import SwiftUI

// تعريف بيانات السيارة
struct CarInfo: Identifiable {
    let id = UUID()
    let image: String
    let type: String
    let model: String
    let year: String
    let price: String
    let postedBy: String
}

// عرض صفحة تفاصيل السيارة
struct CarDetailView: View {
    let car: CarInfo
    
    var body: some View {
        VStack {
            Image(car.image)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(8)
            
            Text("\(car.type) - \(car.model)")
                .font(.largeTitle)
                .padding(.top)
            
            Text("Year: \(car.year)")
                .font(.title2)
                .padding(.top)
            
            Text("Price: \(car.price)")
                .font(.title2)
                .padding(.top)
            
            Text("Posted by: \(car.postedBy)")
                .font(.title3)
                .foregroundColor(.gray)
                .padding(.top)
            
            Spacer()
        }
        .padding()
        .navigationTitle("\(car.model) Details")
    }
}

// عرض صفحة السيارات المعروضة للبيع باسم CarSallView
struct CarSallView: View {
    // قائمة السيارات
    let cars = [
        CarInfo(image: "car_image_1", type: "Sedan", model: "C 200", year: "2023", price: "$60,000", postedBy: "اسم المستخدم"),
        CarInfo(image: "car_image_2", type: "SUV", model: "BMW X1", year: "2024", price: "$50,000", postedBy: " اسم المستخدم"),
        // أضف المزيد من السيارات هنا
    ] + Array(repeating: CarInfo(image: "car_image_1", type: "Sedan", model: "C 200", year: "2023", price: "$60,000", postedBy: "اسم المستخدم"), count: 18)
    
    var body: some View {
        NavigationView {
            List(cars) { car in
                NavigationLink(destination: CarDetailView(car: car)) {
                    HStack {
                        Image(car.image)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(8)
                        
                        VStack(alignment: .leading) {
                            Text("\(car.type) - \(car.model)")
                                .font(.headline)
                            Text("Year: \(car.year)")
                                .font(.subheadline)
                            Text("Price: \(car.price)")
                                .font(.subheadline)
                            Text("Posted by: \(car.postedBy)")
                                .font(.footnote)
                                .foregroundColor(.gray)
                        }
                    }
                    .padding(.vertical, 5)
                }
            }
            .navigationTitle("سيارات تبع المعارض")
            .navigationBarTitleDisplayMode(.inline) // تعديل حجم العنوان ليكون أصغر
        }
    }
}

struct CarSallView_Previews: PreviewProvider {
    static var previews: some View {
        CarSallView()
    }
}


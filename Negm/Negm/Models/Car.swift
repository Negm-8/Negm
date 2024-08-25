//
//  Car.swift
//  Negm
//
//  Created by abdallah negm on 30/07/2024.
//

import Foundation


struct Car: Identifiable,Hashable,Codable {
    
    
    let id: String
        let carName: String
        var rating: Double
        let brand: String
        var pricePerDay: Int
        var description: String
        var mainImageName: String
        var imagesNames: [String]
        var insurance: String
        var maxDistance: Float?
        var numberOfSeats: Int
        var numberOfDoors: Int
        var GasType: String
        var hostName: String
        var hostImageName: String
        var hostJoinDate: String
        var isFavorite: Bool
//    هل انا هاحتاج اعمل ريت جمب الاعلان لا اكيد الريت هاحتاجه تبع المعارض
//    وهايكون علي اساس مبيعات المعرض من التطبيق
    
}

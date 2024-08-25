//
//  buttonView.swift
//  Negm
//
//  Created by abdallah negm on 15/08/2024.
//

import Foundation

enum ProfilViewModel: Int, CaseIterable {
    
    case Signin
    case Messages
    case notification
    case Callus
    case Jobs
    case logout
    
    var title: String {
        switch self {
            
        case .Signin: return "Sign in"
        case .Messages: return "Messages"
        case .notification: return "Notification"
        case .Callus: return "Call us"
        case .Jobs: return "Jobs"
        case .logout: return "Logout"
            
     
        }
    }
    
    var imageName: String {
        switch self {
           
        case .Signin: return "person.fill"
        case .Messages: return "bubble.left"
        case .notification: return "bell"
        case .Callus: return "phone.fill"
        case .Jobs: return "envelope.circle"
        case .logout: return "arrow.left.square"
        }
    }
}

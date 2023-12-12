//
//  NetworkConstants.swift
//  TravelDemoSwiftUI
//
//  Created by Mohamed Bakr on 10/11/2022.
//

import Foundation

enum NetworkConstants: String {
    case BaseUrl = "https://travel.letsbuildthatapp.com/travel_discovery"
}
extension NetworkConstants {
    
    enum Apis: String {
        case restaurant = "restaurant?id=0"
    }
}


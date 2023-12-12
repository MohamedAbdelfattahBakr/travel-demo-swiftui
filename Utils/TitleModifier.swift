//
//  TitleModifier.swift
//  TravelDemoSwiftUI
//
//  Created by Mohamed Bakr on 10/11/2022.
//

import SwiftUI

extension View {
    func asTile() -> some View {
        modifier(TileModeifer())
    }
}
struct TileModeifer: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white)
            .cornerRadius(5)
            .shadow(color: .init(.sRGB, white: 0.8,opacity: 1), radius: 4, x: 0.0, y: 2)
    }
}

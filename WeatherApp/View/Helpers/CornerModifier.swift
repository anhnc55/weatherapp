//
//  CornerModifier.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI

struct CornerModifier: ViewModifier {
    @Binding var bottomOffset: CGFloat
    
    func body(content: Content) -> some View {
        if bottomOffset < 38 {
            content
        } else {
            content.cornerRadius(12)
        }
    }
}

//
//  UVIndexView.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI
import WeatherKit

struct UVIndexView: View {
    var uvIndex: UVIndex
    
    var body: some View {
        return CustomStackView {
            Label {
                Text("UV Index".uppercased())
            } icon: {
                Image(systemName: "sun.max")
            }
        } contentView: {
            VStack(alignment: .leading, spacing: 10) {
                ZStack(alignment: .leading) {
                    Capsule()
                        .fill(.linearGradient(.init(colors: [.green, .yellow, .orange, .red, .purple]),
                                              startPoint: .leading, endPoint: .trailing))
                    GeometryReader { proxy in
                        Circle()
                            .strokeBorder(.black.opacity(0.4), lineWidth: 1)
                            .background(Circle().foregroundColor(Color.white))
                            .position(x: CGFloat(uvCategoryPosition(uvindex: uvIndex, width: Int(proxy.size.width))), y: 2.5)
                            .frame(width: 6, height: 6)
                    }
                }
                .frame(height: 5)
                
                Text(uvIndex.value.formatted())
                    .font(.largeTitle)
                    .fontWeight(.medium)
                
                Text(uvIndex.category.description)
                    .font(.callout)
                    .fontWeight(.regular)

            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
    }
        
    func uvCategoryPosition(uvindex: UVIndex, width: Int) -> Int {
        return width / 11 * uvindex.value + 1
    }
}

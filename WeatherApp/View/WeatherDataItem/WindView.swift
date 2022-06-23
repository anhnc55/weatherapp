//
//  WindView.swift
//  Weather
//
//  Created by Anh Nguyen on 22/06/2022.
//

import SwiftUI
import WeatherKit

struct WindView: View {
    var wind: Wind?
    
    var body: some View {
        CustomStackView {
            Label {
                Text("Wind")
            } icon: {
                Image(systemName: "wind")
            }
            
        } contentView: {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(wind?.speed.formatted() ?? "-")
                    .font(.title)
                    .fontWeight(.semibold)
                
                HStack {
                    Text(wind?.direction.formatted() ?? "-")
                        .font(.callout)
                        .fontWeight(.regular)
                    Text(wind?.compassDirection.description ?? "-")
                        .font(.callout)
                        .fontWeight(.regular)
                }
            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
    }
}

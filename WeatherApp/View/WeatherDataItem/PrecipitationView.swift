//
//  PrecipitationView.swift
//  WeatherApp
//
//  Created by Anh Nguyen on 23/06/2022.
//

import SwiftUI
import WeatherKit

struct PrecipitationView: View {
    var precipitation: Precipitation?
    
    var body: some View {
        CustomStackView {
            Label {
                Text("Wind")
            } icon: {
                Image(systemName: "wind")
            }
            
        } contentView: {
            
            VStack(alignment: .leading, spacing: 10) {
                Text(precipitation?.rawValue ?? "-")
                    .font(.title)
                    .fontWeight(.semibold)
                
                Text(precipitation?.description ?? "-")
                    .font(.title3)
                    .fontWeight(.semibold)

            }
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity,
                   maxHeight: .infinity,
                   alignment: .leading)
        }
    }
}

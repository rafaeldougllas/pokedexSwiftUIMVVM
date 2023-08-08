//
//  CustomLinkButtonStyle.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 07/08/23.
//

import SwiftUI

@available(iOS 16.0, *)
struct CustomLinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .foregroundColor(.white)
            .fontWeight(.bold)
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(
                Capsule()
                    .fill(Color.orange)
            )
    }
}

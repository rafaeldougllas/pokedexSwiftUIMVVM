//
//  CustomButton.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 24/07/23.
//

import SwiftUI

struct CustomButton: View {
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            Text(text)
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
}

#Preview {
    CustomButton(text: "Login", action: {})
}

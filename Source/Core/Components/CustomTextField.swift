//
//  CustomTextField.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 24/07/23.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: String
    @Binding var text: String
    var isPassword: Bool = false
    
    var body: some View {
        if isPassword {
            SecureField(placeholder, text: $text).frame(height: 50)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .stroke(Color.black, lineWidth: 2)
                )
        } else {
            TextField(placeholder, text: $text)
                .frame(height: 50)
                .padding(.horizontal)
                .background(
                    Capsule()
                        .stroke(Color.black, lineWidth: 2)
                )
        }
    }
}

#Preview {
    CustomTextField(placeholder: "", text: .constant(""), isPassword: true)
}

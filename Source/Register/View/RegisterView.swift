//
//  RegisterView.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 24/07/23.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack(spacing: 24) {
            registerCoverImage
            
            CustomTextField(placeholder: "Type your email",
                            text: $viewModel.email)
            CustomTextField(placeholder: "Type your password",
                            text: $viewModel.password)
            CustomTextField(placeholder: "Confirm your password",
                            text: $viewModel.passwordConfirm)
            
            Text("\(viewModel.errorMessage)")
                .font(.subheadline)
                .foregroundStyle(.red)
            
            CustomButton(text: "Register") {
                viewModel.register()
            }
            
            switchButton
        }
        .padding(.horizontal)
        .navigationBarBackButtonHidden(true)
    }
}
extension RegisterView {
    var registerCoverImage: some View {
        Image("pokemon-cover")
            .resizable()
            .scaledToFit()
    }
    
    var switchButton: some View {
        HStack {
            Text("Already have an account?")
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Enter")
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }

        }
    }
}

#Preview {
    RegisterView()
}

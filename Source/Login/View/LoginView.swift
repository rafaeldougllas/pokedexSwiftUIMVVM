//
//  LoginView.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 24/07/23.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel = LoginViewModel()
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 24) {
                loginCoverImage
                
                CustomTextField(placeholder: "Type your e-mail",
                                text: $viewModel.emailTextField)
                
                CustomTextField(placeholder: "Type your password",
                                text: $viewModel.passwordTextField,
                                isPassword: true)
                
                CustomButton(text: "Enter") {
                    viewModel.canNavigate = viewModel.fieldsEmpty()
                }
                
                switchButton
            }
            .padding(.horizontal)
            .navigationDestination(isPresented: $viewModel.canNavigate) {
                PokeDexView()
            }
            .navigationBarTitle("Login", displayMode: .inline)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .toolbarBackground(
                Color.orange,
                for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        }
    }
}

extension LoginView {
    var loginCoverImage: some View {
        Image("pokemon-cover")
            .resizable()
            .scaledToFit()
    }
    
    var switchButton: some View {
        HStack {
            Text("Not have an account yet?")
            
            NavigationLink {
                RegisterView()
            } label: {
                Text("Register")
                    .foregroundColor(.orange)
                    .fontWeight(.bold)
            }
            
        }
    }
}

#Preview {
    LoginView()
}

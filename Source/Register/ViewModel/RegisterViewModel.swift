//
//  RegisterViewModel.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 08/08/23.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var passwordConfirm: String = ""
    @Published var errorMessage: String = ""
}

extension RegisterViewModel {
    func register() {
        if email.isEmpty || password.isEmpty || passwordConfirm.isEmpty {
            errorMessage = "Fill all fields"
        } else if password != passwordConfirm {
            errorMessage = "Password and Password confirmation should be the same"
        } else {
            errorMessage = ""
            print("Register with:")
            print("Email: \(email)")
            print("Password: \(password)")
        }
    }
}

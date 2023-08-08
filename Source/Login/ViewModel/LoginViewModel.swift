//
//  LoginViewModel.swift
//  PokeDexSwiftUI
//
//  Created by rafael douglas on 08/08/23.
//

import SwiftUI

class LoginViewModel: ObservableObject {
    @Published var canNavigate: Bool = false
    @Published var emailTextField: String = ""
    @Published var passwordTextField: String = ""
}
extension LoginViewModel {
    func fieldsEmpty() -> Bool {
        return !emailTextField.isEmpty && !passwordTextField.isEmpty
    }
}

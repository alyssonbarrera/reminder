//
//  LoginBottomSheetViewModel.swift
//  Reminder
//
//  Created by Alysson Barrera on 21/12/24.
//

import Firebase

class LoginBottomSheetViewModel {
    var successResult: (() -> Void)?
    
    func doAuth(usernameLogin: String, password: String) {
        print(usernameLogin, password)
        Auth.auth().signIn(withEmail: usernameLogin, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Falha na autenticação \(error)")
            } else {
                self?.successResult?()
            }
        }
    }
}

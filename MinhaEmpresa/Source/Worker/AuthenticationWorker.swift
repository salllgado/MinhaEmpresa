//
//  AuthenticationWorker.swift
//  MinhaEmpresa
//
//  Created by Chrystian Salgado on 17/09/19.
//  Copyright © 2019 Salgado's Production. All rights reserved.
//

import Foundation
import LocalAuthentication

protocol AuthenticationWorkable {
    func requestForUserAuthentication(completionHandler: @escaping (_ success: Bool)-> Void)
}

class AuthenticationWorker: AuthenticationWorkable {
    
    let myContext = LAContext()
    
    /// Ask for user authentication with biometic
    func requestForUserAuthentication(completionHandler: @escaping (_ success: Bool)-> Void) {
        let myLocalizedReasonString = "Biometric Authentication"
        
        var authError: NSError?
        if myContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &authError) {
            myContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: myLocalizedReasonString) { success, evaluateError in
                DispatchQueue.main.async {
                    completionHandler(success)
                }
            }
        } else {
            // Could not evaluate policy; look at authError and present an appropriate message to user
            Logger.log("Sorry!!.. Could not evaluate policy.")
        }
    }
}

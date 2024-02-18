//
//  LoginInteractor.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import Foundation


protocol LoginInteractorInterface {

    var presenter: LoginPresenterInterface? { get set }

    func fetchLogin(username: String, password: String, completion: @escaping (Bool) -> ())
}

class LoginInteractor: LoginInteractorInterface {
    var presenter: LoginPresenterInterface?
    
    func fetchLogin(username: String, password: String, completion: @escaping (Bool) -> ()) {
        let salt = "123456"
        if let decrypted = decrypt(text: password, salt: salt) {
            
            if decrypted == "magnusaja" && username == "magnus" {
                self.presenter?.interactorDidFetchLogin(with: .success(username))
            }
            else{
                self.presenter?.interactorDidFetchLogin(with: .success(""))
            }
            
        }
        
    }
    
}

//
//  LoginPresenter.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import Foundation

protocol LoginPresenterInterface: AnyObject {
    var router: LoginRouterInterface? { get set }
    var interactor: LoginInteractorInterface? { get set }
    var view: LoginViewInterface? { get set }
 
    func notifyViewDidLoad()
    func viewDidLogin(with username: String, with password: String)
    func interactorDidFetchLogin(with result: Result<String, Error>)
    func viewPushToHome(with userLogin: String)
}

class LoginPresenter: LoginPresenterInterface {
    
    var router: LoginRouterInterface?
    
    var interactor: LoginInteractorInterface?
    
    var view: LoginViewInterface?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
    
    func viewDidLogin(with username: String, with password: String) {
        interactor?.fetchLogin(username: username, password: password, completion: { _ in
        })
    }
    
    func interactorDidFetchLogin(with result: Result<String, Error>) {
        switch result {
        case .success(let results):
            print(results)
            view?.showView(with: results)
        case .failure(let error):
            print(error)
        }
    }
    
    func viewPushToHome(with userLogin: String) {
        router?.pushToHome(on: view!, with: userLogin)
    }
    
    
}

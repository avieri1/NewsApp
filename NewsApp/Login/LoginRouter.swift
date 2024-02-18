//
//  LoginRouter.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import Foundation
import UIKit

typealias EntryPoint = LoginViewInterface & UIViewController

protocol LoginRouterInterface {
    var entry: EntryPoint? { get }
    
    static func start() -> LoginRouterInterface
    func pushToHome(on view: LoginViewInterface, with userLogin: String)
}

class LoginRouter: LoginRouterInterface {
    
    var entry: EntryPoint?
    
    static func start() -> LoginRouterInterface {
        let router = LoginRouter()
        
        var view: LoginViewInterface = LoginVC()
        let presenter: LoginPresenterInterface = LoginPresenter()
        var interactor: LoginInteractorInterface = LoginInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router  = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPoint
    
        return router
    }
    
    func pushToHome(on view: LoginViewInterface, with userLogin: String) {
        DispatchQueue.main.async {
//            let HomeRouter = HomeTabRouter.start(with: userLogin)
//            let homeVC = HomeRouter.entry
            let detailVC = HomeTabRouter.start(with: userLogin)
            let vc = view as! LoginVC
            vc.navigationController?.pushViewController(detailVC, animated: true)
        }
    }
    

}

//
//  ProfileRouter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import UIKit

typealias EntryPointProfile = ProfileViewInterface & UIViewController

protocol ProfileRouterInterface {
    var entry: EntryPointProfile? { get }
    static func start(with userLogin: String) -> ProfileRouterInterface
    func logOutToLogin()
}

class ProfileRouter: ProfileRouterInterface {
    
    var entry: EntryPointProfile?
    
   
    static func start(with userLogin: String) -> ProfileRouterInterface {
        let router = ProfileRouter()
        
        var view: ProfileViewInterface = ProfileVC()
        let presenter: ProfilePresenterInterface = ProfilePresenter()
        
        print(userLogin)
        view.presenter = presenter
        view.username = userLogin
        presenter.router  = router
        presenter.view = view
       
        router.entry = view as? EntryPointProfile
        
        return router
    }
    
    func logOutToLogin() {
        let LoginRouter = LoginRouter.start()
        let initVC = LoginRouter.entry
        
        let navCtrl = UINavigationController(rootViewController: initVC!)

        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        
        guard let window = firstScene.windows.first else {
            return
        }
        
        let rootViewController = window.rootViewController

        navCtrl.view.frame = (rootViewController?.view.frame)!
        navCtrl.view.layoutIfNeeded()

        UIView.transition(with: window, duration: 0.5, options: .transitionCrossDissolve, animations: {
            window.rootViewController = navCtrl
        })
    }
    
    
}

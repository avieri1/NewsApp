//
//  ProfilePresenter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol ProfilePresenterInterface: AnyObject {
    var router: ProfileRouterInterface? { get set }
   
    var view: ProfileViewInterface? { get set }
 
    func notifyViewDidLoad()
    func viewDidLogout()
    
}

class ProfilePresenter: ProfilePresenterInterface {
    
    
    var router: ProfileRouterInterface?
    
    var view: ProfileViewInterface?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
    
    func viewDidLogout() {
        router?.logOutToLogin()
    }
    
    
}

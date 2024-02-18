//
//  HomeTabPresenter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol HomeTabPresenterInterface: AnyObject {
    var router: HomeTabRouterInterface? { get set }
    var view: HomeTabViewInterface? { get set }
    var interactor: HomeTabInteractorInterface? { get set }
    func interactorDidGetUsername(with username: String)

}

class HomeTabPresenter: HomeTabPresenterInterface {
    var interactor: HomeTabInteractorInterface? {
        didSet {
            interactor?.geUsername()
        }
    }
    
    var router: HomeTabRouterInterface? 
    
    var view: HomeTabViewInterface?
    
    func interactorDidGetUsername(with username: String) {
        view?.setupView(with: username)
    }
    
    
}

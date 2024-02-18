//
//  HomePresenter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    var router: HomeRouterInterface? { get set }
   
    var view: HomeViewInterface? { get set }
 
    func notifyViewDidLoad()
    
}

class HomePresenter: HomePresenterInterface {
    
    var router: HomeRouterInterface?
    
    var view: HomeViewInterface?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
    
    
}

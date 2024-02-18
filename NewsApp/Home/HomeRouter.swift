//
//  HomeRouter.swift
//  NewsApp
//
//  Created by aldo on 16/02/24.
//

import Foundation
import UIKit

typealias EntryPointHome = HomeViewInterface & UIViewController

protocol HomeRouterInterface {
    var entry: EntryPointHome? { get }
    static func start() -> HomeRouterInterface
}

class HomeRouter: HomeRouterInterface {
    var entry: EntryPointHome?
    
   
    static func start() -> HomeRouterInterface {
        let router = HomeRouter()
        
        var view: HomeViewInterface = HomeVC()
        let presenter: HomePresenterInterface = HomePresenter()
       
        view.presenter = presenter
        
        presenter.router  = router
        presenter.view = view
       
        router.entry = view as? EntryPointHome
        
        return router
    }
    
    
}

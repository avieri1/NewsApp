//
//  HomeTabRouter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import UIKit

typealias EntryPointTab = HomeTabViewInterface & UIViewController

protocol HomeTabRouterInterface {
//    var entry: EntryPointTab? { get }
    static func start(with userLogin: String) -> UIViewController
}

class HomeTabRouter: HomeTabRouterInterface {
//    var entry: EntryPointTab?
   
    static func start(with userLogin: String) -> UIViewController {
        
        let viewController = HomeTabVC()
        
        let presenter: HomeTabPresenterInterface = HomeTabPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = HomeTabRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeTabInteractor()
        viewController.presenter?.interactor?.username = userLogin
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    
    }

    
    
}

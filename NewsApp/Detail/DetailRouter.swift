//
//  DetailRouter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import UIKit

protocol DetailRouterInterface {
    
    static func start(with detailLink: String) -> UIViewController
}

class DetailRouter: DetailRouterInterface {
   
    static func start(with detailLink: String) -> UIViewController {
        let viewController = DetailVC()
        
        let presenter: DetailPresenterInterface = DetailPresenter()
        viewController.presenter = presenter
        viewController.presenter?.router = DetailRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = DetailInteractor()
        viewController.presenter?.interactor?.detailLink = detailLink
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
    
}

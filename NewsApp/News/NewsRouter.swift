//
//  NewsRouter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import UIKit

typealias EntryPointNews = NewsViewInterface & UIViewController

protocol NewsRouterInterface {
    var entry: EntryPointNews? { get }
    static func start() -> NewsRouterInterface
    func pushToDetail(on view: NewsViewInterface, with detailLink: String)
}

class NewsRouter: NewsRouterInterface {
    
    var entry: EntryPointNews?
    
    static func start() -> NewsRouterInterface {
        let router = NewsRouter()
        
        var view: NewsViewInterface = NewsVC()
        let presenter: NewsPresenterInterface = NewsPresenter()
        var interactor: NewsInteractorInterface = NewsInteractor()
        
        view.presenter = presenter
        interactor.presenter = presenter
        
        presenter.router  = router
        presenter.view = view
        presenter.interactor = interactor
        
        router.entry = view as? EntryPointNews
    
        return router
    }
    
    func pushToDetail(on view: NewsViewInterface, with detailLink: String) {
        DispatchQueue.main.async {
            let detailVC = DetailRouter.start(with: detailLink)
            let vc = view as! NewsVC
            vc.present(detailVC, animated: true)
        }
    }
    
    
}

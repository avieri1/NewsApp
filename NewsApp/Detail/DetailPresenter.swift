//
//  DetailPresenter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol DetailPresenterInterface: AnyObject {
    var router: DetailRouterInterface? { get set }
    var interactor: DetailInteractorInterface? { get set }
    var view: DetailViewInterface? { get set }
    func interactorDidFetchDetailNews(with detailLink: String)
    func notifyViewDidLoad()
}

class DetailPresenter: DetailPresenterInterface {
    
    var router: DetailRouterInterface?
    
    var interactor: DetailInteractorInterface? {
        didSet {
            interactor?.getDetailNews()
        }
    }
    
    var view: DetailViewInterface?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
    func interactorDidFetchDetailNews(with detailLink: String) {
        view?.show(with: detailLink)
    }
    
    
}

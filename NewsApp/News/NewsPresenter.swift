//
//  NewsPresenter.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol NewsPresenterInterface: AnyObject {
    var router: NewsRouterInterface? { get set }
    var interactor: NewsInteractorInterface? { get set }
    var view: NewsViewInterface? { get set }
 
    func notifyViewDidLoad()
    func fetchDatas(with country: String)

    func interactorDidFetchNews(with result: Result<NewsModel, Error>)
    func viewPushToDetail(with detailLink: String)
}

class NewsPresenter: NewsPresenterInterface {
    
    var router: NewsRouterInterface?
    
    var interactor: NewsInteractorInterface?
    
    var view: NewsViewInterface?
    
    func notifyViewDidLoad() {
        view?.setupView()
    }
    
    func fetchDatas(with country: String) {
        interactor?.fetchNews(country: country)
    }
    
    func interactorDidFetchNews(with result: Result<NewsModel, Error>) {
        switch result {
        case .success(let results):
            print(results)
            view?.showView(with: results)
        case .failure(let error):
            print(error)
        }
    }
    
    func viewPushToDetail(with detailLink: String) {
        router?.pushToDetail(on: view!, with: detailLink)
    }
    
    
}

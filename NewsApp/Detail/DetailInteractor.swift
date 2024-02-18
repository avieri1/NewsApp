//
//  DetailInteractor.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation

protocol DetailInteractorInterface {
    var presenter: DetailPresenterInterface? { get set }
    var detailLink: String? { get set }
    func getDetailNews()
}

class DetailInteractor: DetailInteractorInterface {
    var presenter: DetailPresenterInterface?
    var detailLink: String?
    
    func getDetailNews() {
        presenter?.interactorDidFetchDetailNews(with: detailLink ?? "")
    }
    
    
}

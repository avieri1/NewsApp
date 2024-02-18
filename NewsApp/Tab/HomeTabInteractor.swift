//
//  HomeTabInteractor.swift
//  NewsApp
//
//  Created by aldo on 18/02/24.
//

import Foundation

protocol HomeTabInteractorInterface {
    var presenter: HomeTabPresenterInterface? { get set }
    var username: String? { get set }
    func geUsername()
}

class HomeTabInteractor: HomeTabInteractorInterface {
    var presenter: HomeTabPresenterInterface?
    var username: String?
    
    func geUsername() {
        presenter?.interactorDidGetUsername(with: username ?? "")
    }
    
    
}

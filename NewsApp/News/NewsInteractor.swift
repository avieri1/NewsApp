//
//  NewsInteractor.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import Moya

protocol NewsInteractorInterface {
    var provider: MoyaProvider<API> { get }
    var presenter: NewsPresenterInterface? { get set }

    func fetchNews(country: String)
}

class NewsInteractor: NewsInteractorInterface {
    var provider = Moya.MoyaProvider<API>(plugins: [NetworkLoggerPlugin()])
    
    var presenter: NewsPresenterInterface?
    
    func fetchNews(country: String) {
        
        provider.request(.getNews(country: country)) { result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(NewsModel.self, from: response.data)

                    self.presenter?.interactorDidFetchNews(with: .success(results))
                } catch let error {
                    self.presenter?.interactorDidFetchNews(with: .failure(error))
                    print("\(error.localizedDescription)")
                }
            case let .failure(error):
                self.presenter?.interactorDidFetchNews(with: .failure(error))
            }
        }
        
    }
    
}

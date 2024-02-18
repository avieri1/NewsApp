//
//  API.swift
//  NewsApp
//
//  Created by aldo on 17/02/24.
//

import Foundation
import Moya

enum API {
    case getNews(country: String)
}

extension API: TargetType {
    var baseURL: URL {
        guard let url = URL(string: Constants.API.baseUrl) else { fatalError() }
        return url
    }
    
    var path: String {
        switch self {
        case .getNews:
            return Constants.API.news
        }
    }
    
    var method: Moya.Method {
        .get
    }
    
    var task: Moya.Task {
        switch self {
        case .getNews(let country):
            let param = ["country" : country] as [String : Any]
            return .requestParameters(parameters: param, encoding: URLEncoding.queryString)
        }
    }
    
    var headers: [String : String]? {
        return ["Authorization": "bc5dc77ab0e343d6a06f3d42d62647d5"]
    }
    
    
}

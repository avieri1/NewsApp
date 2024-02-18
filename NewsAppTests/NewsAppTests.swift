//
//  NewsAppTests.swift
//  NewsAppTests
//
//  Created by aldo on 16/02/24.
//

import XCTest
import Moya
@testable import NewsApp

final class NewsAppTests: XCTestCase {

    var provider: MoyaProvider<API>!
   
    override func setUp() {
        super.setUp()
        provider = MoyaProvider<API>(stubClosure: MoyaProvider.delayedStub(0.5))
    }
    
    override func tearDown() {
        super.tearDown()
        provider = nil
    }
    
    func testGetNews() throws {
        provider.request(.getNews(country: "id")) { result in
            switch result {
            case .success(let response):
                XCTAssertEqual(response.statusCode, 200)
            case .failure(let error):
                XCTFail(error.localizedDescription)
            }
        }
    }

}

//
//  CBAOnlineTestTests.swift
//  CBAOnlineTestTests
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 13/03/22.
//

import XCTest
@testable import CBAOnlineTest
class CBAOnlineTestTests: XCTestCase {
var viewControllerObj = ViewController()
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCallValidApiForNews () {
        viewControllerObj.getNewsData("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=05030e7af26c4f52b9cdcf04dadf5a30",completion: { result in
            switch result {
            case .success(let news) :
                XCTAssertNotNil(news)
            case .failure(let error) :
                
                XCTAssertNil(error)
            
            }
            
            
        })
    }
    func testCallInValidApiForNews () {
        viewControllerObj.getNewsData("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=05030e7af26c4f52b",completion: { result in
            switch result {
            case .success(let news) :
                XCTAssertNil(news)
            case .failure(let error) :
                
                XCTAssertNotNil(error)
            
            }
            
            
        })
    }
    func testDataModel() {
        viewControllerObj.getNewsData("https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=05030e7af26c4f52b9cdcf04dadf5a30",completion: { result in
            switch result {
            case .success(let news) :
                let articles:[Article] = news.articles
                XCTAssertNotNil(articles)
                for index in 0..<articles.count {
                    XCTAssertNotEqual("", articles[index].description, "Description can not be empty String")
                    XCTAssertNotEqual("", articles[index].urlToImage, "Description can not be empty String")
                    XCTAssertNotEqual("", articles[index].title, "Description can not be empty String")
                    
                }
                
                
            case .failure(let error) :
                
                XCTAssertNil(error)
            
            }
            
            
        })
    }

}

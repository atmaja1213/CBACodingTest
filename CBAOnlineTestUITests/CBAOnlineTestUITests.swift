//
//  CBAOnlineTestUITests.swift
//  CBAOnlineTestUITests
//
//  Created by Sahoo, Atmaja(AWF)(eCG) on 13/03/22.
//

import XCTest

class CBAOnlineTestUITests: XCTestCase {
   
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
    func testTheNewsScreen() {
        
        let tablesQuery = XCUIApplication().tables
        tablesQuery.children(matching: .cell).element(boundBy: 3).staticTexts["We are getting the news soon...We just need some more information to get the things ready and deliver an awesome news reading experience for you & keep you fully updated."].swipeUp()
        tablesQuery.children(matching: .cell).element(boundBy: 13).staticTexts["We are getting the news soon..."].swipeUp()
        
    }
}

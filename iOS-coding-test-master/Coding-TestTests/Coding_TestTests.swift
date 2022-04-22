//
//  Coding_TestTests.swift
//  Coding-TestTests
//
//  Created by Masher Shin on 8/2/20.
//  Copyright © 2020 DeliveyHero. All rights reserved.
//

import XCTest
@testable import Coding_Test


enum urlsetver: String {
    case url1 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/1/restaurant.json"
    case url2 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/2/restaurant.json"
    case url3 = "https://beomcheol.github.io/ios-codding-test-resources/restaurants/3/restaurant.json"
}

class Coding_TestTests: XCTestCase {

    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        let app = XCUIApplication()
        app.launch()
        
        var viewModel = TestviewModel()
        viewModel.url = urlsetver.url2.rawValue
        
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}



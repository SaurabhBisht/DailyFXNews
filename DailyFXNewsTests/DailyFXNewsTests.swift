//
//  DailyFXNewsTests.swift
//  DailyFXNewsTests
//
//  Created by Saurabh Bisht on 23/12/2021.
//

import XCTest
@testable import DailyFXNews

class DailyFXNewsTests: XCTestCase {
    
    var baseNewsViewModel = BaseNewsViewModel()
    var baseNewsModel = BaseNewsModel.self
    
    /// Default func
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    /// Default func
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    func testBaseData_ReturnsSuccess(){
        let expectation = self.expectation(description: "Get Base Data")
        baseNewsViewModel.getBaseData  { result in
            switch result {
            case .success(_):
                DispatchQueue.main.async {
                    expectation.fulfill()
                }
            case .failure(_):
                _ = expectation.isInverted
            }
        }
        
        self.wait(for: [expectation], timeout: 5)
    }

}

//
//  NetworkTests.swift
//  MarvelHerosTests
//
//  Created by Nirosha Pabolu on 05/02/24.
//

import XCTest
@testable import MarvelHeros

final class NetworkTests: XCTestCase {

    var sut: HerosAPIService?
    
    override func setUpWithError() throws {
        sut = HerosAPIService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchHeros() throws {
        let sut = try XCTUnwrap(sut)
        
        let expectation = XCTestExpectation(description: "Successful API response")
        
        let cancellable = sut.fetchHeros()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    expectation.fulfill()
                case .failure:
                    XCTFail("Unexpected failure")
                }
            }, receiveValue: { response in
                // Add assertions to check the decoded response
                // XCTAssert(response.property == expectedValue)
            })

        wait(for: [expectation], timeout: 5.0)
        cancellable.cancel()
    }
}

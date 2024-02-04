//
//  MarvelHerosTests.swift
//  MarvelHerosTests
//


import XCTest
import Combine
@testable import MarvelHeros

final class MarvelHerosTests: XCTestCase {

    var sut: HerosViewModel?
    
    override func setUpWithError() throws {
        sut = HerosViewModel(service: HerosMockService())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testFetchHeros() throws {
        let sut = try XCTUnwrap(sut)
        sut.fetchHeros()
        
        XCTAssertGreaterThan(sut.heroes.count, 0)
    }
    
    func testFetchHerosEmpty() throws {
        sut = nil
        sut = HerosViewModel(service: HerosMockServiceEmptyResponse())
        let sut = try XCTUnwrap(sut)
        sut.fetchHeros()
        
        XCTAssertEqual(sut.heroes.count, 0)
    }
}

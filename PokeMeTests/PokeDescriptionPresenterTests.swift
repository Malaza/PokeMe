//
//  PokeDescriptionPresenterTests.swift
//  PokeMeTests
//
//  Created by Mthokozisi Malaza on 2023/09/15.
//

import XCTest
@testable import PokeMe

final class PokeDescriptionPresenterTests: XCTestCase {
    
    var presenter: PokeDescriptionPresenter?
    
    override func setUpWithError() throws {
        let vc = PokeDescriptionViewController()
        let interactor = PokeDescriptionInteractor()
        let router = PokeDescriptionRouter()
        presenter = PokeDescriptionPresenter(interactor: interactor, router: router, view: vc)
    }
    
    func testThatPresenterInstantiated() throws {
        XCTAssertNotNil(presenter)
    }
    
    func testThatInteractorInstantiated() throws {
        XCTAssertNotNil(presenter?.interactor)
    }
    
    func testThatRouterInstantiated() throws {
        XCTAssertNotNil(presenter?.router)
    }

    func testThatVCInstantiated() throws {
        XCTAssertNotNil(presenter?.view)
    }

    override func tearDownWithError() throws {
        presenter = nil
    }
    
    func testPerformanceExample() throws {}
}

//
//  PokeListPresenterTests.swift
//  PokeMeTests
//
//  Created by Mthokozisi Malaza on 2023/09/15.
//

import XCTest
@testable import PokeMe

final class PokeListPresenterTests: XCTestCase {
    
    var presenter: PokeListPresenter?
    
    override func setUpWithError() throws {
        let vc = PokeListViewController()
        let interactor = PokeListInteractor()
        let router = PokeListRouter()
        presenter = PokeListPresenter(interactor: interactor, router: router, view: vc)
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

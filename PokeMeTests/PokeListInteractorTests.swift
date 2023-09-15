//
//  PokeListInteractorTests.swift
//  PokeMeTests
//
//  Created by Mthokozisi Malaza on 2023/09/15.
//

import XCTest
@testable import PokeMe

enum TestError: Error {
    case interactorInstantiationFailed
}

final class PokeListInteractorTests: XCTestCase {
    
    var interactor: PokeListInteractor?
    
    override func setUpWithError() throws {
        let vc = PokeListViewController()
        interactor = PokeListInteractor()
        let router = PokeListRouter()
        guard let nonEmptyInteractor = interactor else { throw TestError.interactorInstantiationFailed }
        let presenter = PokeListPresenter(interactor: nonEmptyInteractor, router: router, view: vc)
        vc.presenter = presenter
        interactor?.presenter = presenter
    }

    
    
    func testThatServiceIsAvailable() throws {
        XCTAssertNotNil(interactor?.service)
    }

    func testThatInteractorInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter)
    }
    
    func testThatRouterInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter?.router)
    }

    func testThatVCInstantiated() throws {
        XCTAssertNotNil(interactor?.presenter?.view)
    }
    
    func testPerformanceExample() throws {}
    
    override func tearDownWithError() throws {
        interactor = nil
    }
}

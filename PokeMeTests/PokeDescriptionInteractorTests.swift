//
//  PokeDescriptionInteractorTests.swift
//  PokeMeTests
//
//  Created by Mthokozisi Malaza on 2023/09/15.
//

import XCTest
@testable import PokeMe

final class PokeDescriptionInteractorTests: XCTestCase {
    
    var interactor: PokeDescriptionInteractor?
    
    override func setUpWithError() throws {
        let vc = PokeDescriptionViewController()
        interactor = PokeDescriptionInteractor()
        let router = PokeDescriptionRouter()
        guard let nonEmptyInteractor = interactor else { throw TestError.interactorInstantiationFailed }
        let presenter = PokeDescriptionPresenter(interactor: nonEmptyInteractor, router: router, view: vc)
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

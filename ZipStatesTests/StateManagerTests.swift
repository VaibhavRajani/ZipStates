//
//  StateManagerTests.swift
//  ZipStatesTests
//
//  Created by Vaibhav Rajani on 1/5/24.
//

import XCTest
@testable import ZipStates

class StateManagerTests: XCTestCase {
    var stateManager: StateManager!
    var testBundle: Bundle!

    override func setUpWithError() throws {
        super.setUp()
        stateManager = StateManager()
        testBundle = Bundle(for: type(of: self))
    }

    override func tearDownWithError() throws {
        stateManager = nil
        super.tearDown()
    }

    func testLoadStates() throws {
        stateManager.loadStates()
        XCTAssertFalse(stateManager.states.isEmpty, "States should not be empty after loading")
    }

    func testSaveStates() throws {
        stateManager.states = ["TestState": ["12345", "67890"]]

        stateManager.saveStates()

        stateManager.loadStates()

        XCTAssertEqual(stateManager.states["TestState"], ["12345", "67890"], "Saved states should be correctly loaded back")
    }
}

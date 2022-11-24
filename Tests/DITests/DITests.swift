//
//  DITests.swift
//
//  Created by Giorgi Kratsashvili on 11/24/22.
//

import XCTest
@testable import DI

final class DITests: XCTestCase {
    fileprivate class Shared {}
    fileprivate class New {}

    private let sut = DependencyContainer {
        Dependency { Shared() }
        Dependency(id: "id", instanceType: .new) {
            New()
        }
    }

    func testInjectShared() {
        @Inject(container: sut) var dep1: Shared
        let dep2: Shared = sut.resolve()
        XCTAssertTrue(dep1 === dep2)
    }

    func testInjectNewWithId() {
        @Inject(container: sut, id: "id") var dep1: New
        let dep2: New = sut.resolve(id: "id")
        XCTAssertTrue(dep1 !== dep2)
    }
}

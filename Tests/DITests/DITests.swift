//
//  DITests.swift
//
//  Created by Giorgi Kratsashvili on 11/24/22.
//

import Testing
@testable import DI

@Suite
struct DITests {
    fileprivate class Shared {}
    fileprivate class New {}

    private let sut = DependencyContainer {
        Dependency { Shared() }
        Dependency(id: "id", instanceType: .new) {
            New()
        }
    }

    @Test
    func testInjectShared() {
        @Inject(container: sut) var dep1: Shared
        let dep2: Shared = sut.resolve()
        #expect(dep1 === dep2)
    }

    @Test
    func testInjectNewWithId() {
        @Inject(container: sut, id: "id") var dep1: New
        let dep2: New = sut.resolve(id: "id")
        #expect(dep1 !== dep2)
    }

    @Test
    func testStorageTrue() {
        @Inject(container: sut, id: "id") var dep1: New
        let dep2 = dep1
        #expect(dep1 === dep2)
    }

    @Test
    func testStorageFalse() {
        @Inject(container: sut, id: "id", storage: false) var dep1: New
        let dep2 = dep1
        #expect(dep1 !== dep2)
    }
}

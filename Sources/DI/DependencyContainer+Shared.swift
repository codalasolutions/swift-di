//
//  DependencyContainer+Shared.swift
//
//  Created by Giorgi Kratsashvili on 11/24/22.
//

public extension DependencyContainer {
    nonisolated(unsafe) static var shared = DependencyContainer()
}

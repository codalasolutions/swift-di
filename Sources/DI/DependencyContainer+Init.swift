//
//  DependencyContainer+Init.swift
//
//  Created by Giorgi Kratsashvili on 11/24/22.
//

public extension DependencyContainer {
    @resultBuilder struct DependecyBuilder {
        public static func buildBlock(_ dependencies: Dependency...) -> [Dependency] { dependencies }
    }

    convenience init(@DependecyBuilder _ dependencies: () -> [Dependency]) {
        self.init()
        register(dependencies)
    }

    func register(@DependecyBuilder _ dependencies: () -> [Dependency]) {
        dependencies().forEach { register(dependecy: $0) }
    }
}

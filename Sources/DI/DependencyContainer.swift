//
//  DependencyContainer.swift
//
//  Created by Giorgi Kratsashvili on 11/22/22.
//

public class DependencyContainer {
    nonisolated(unsafe) private var dependencies: [Dependency.ID: Dependency] = [:]

    func register(dependecy: Dependency) {
        dependencies[dependecy.id] = dependecy
    }

    func resolve<T>(id: Dependency.ID? = nil) -> T {
        let id = id ?? Dependency.id(for: T.self)
        guard let dependency: T = dependencies[id]?.instance() as? T else {
            fatalError("Dependency '\(id)' not resolved!")
        }
        return dependency
    }
}

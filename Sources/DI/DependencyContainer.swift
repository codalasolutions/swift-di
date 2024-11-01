//
//  DependencyContainer.swift
//
//  Created by Giorgi Kratsashvili on 11/22/22.
//

import Darwin

public final class DependencyContainer {
    private var dependencies: [Dependency.ID: Dependency] = [:]
    private var lock = os_unfair_lock_s()

    func register(dependecy: Dependency) {
        dependencies[dependecy.id] = dependecy
    }

    func resolve<T>(id: Dependency.ID? = nil) -> T {
        let id = id ?? Dependency.id(for: T.self)
        os_unfair_lock_lock(&lock)
        let dependency = dependencies[id]?.instance()
        os_unfair_lock_unlock(&lock)
        guard let dependency = dependency as? T else {
            fatalError("Dependency '\(id)' not resolved!")
        }
        return dependency
    }
}

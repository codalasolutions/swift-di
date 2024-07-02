//
//  DependencyContainer.swift
//
//  Created by Giorgi Kratsashvili on 11/22/22.
//

public class DependencyContainer {
    private var dependencies: [Dependency.ID: Dependency] = [:]

    func register(dependecy: Dependency) {
        dependencies[dependecy.id] = dependecy
    }
    
    func remove<T>(type: T.Type) {
        let id = Dependency.id(for: T.self)
        dependencies.removeValue(forKey: id)
    }

    func resolve<T>(id: Dependency.ID? = nil) -> T {
        let id = id ?? Dependency.id(for: T.self)
        guard let dependency: T = dependencies[id]?.instance() as? T else {
            fatalError("Dependency '\(id)' not resolved!")
        }
        return dependency
    }
    
    func contains<T>(type: T.Type) -> Bool {
        let id = Dependency.id(for: T.self)
        return dependencies[id] != nil
    }
}

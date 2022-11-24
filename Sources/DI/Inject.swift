//
//  Inject.swift
//
//  Created by Giorgi Kratsashvili on 11/22/22.
//

@propertyWrapper
public class Inject<T> {
    public var container: DependencyContainer
    public var id: Dependency.ID
    public lazy var wrappedValue: T = container.resolve(id: id)

    public init(container: DependencyContainer = .shared, id: Dependency.ID? = nil) {
        self.container = container
        self.id = id ?? Dependency.id(for: T.self)
    }
}

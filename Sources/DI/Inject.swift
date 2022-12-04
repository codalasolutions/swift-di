//
//  Inject.swift
//
//  Created by Giorgi Kratsashvili on 11/22/22.
//

@propertyWrapper
public class Inject<T> {
    public var container: DependencyContainer
    public var id: Dependency.ID
    public var storage: Bool
    public var wrappedValue: T {
        if storage {
            if let value = storageValue {
                return value
            }
            let value: T = container.resolve(id: id)
            storageValue = value
            return value
        }
        storageValue = nil
        return container.resolve(id: id)
    }
    private var storageValue: T?

    public init(container: DependencyContainer = .shared, id: Dependency.ID? = nil, storage: Bool = true) {
        self.container = container
        self.id = id ?? Dependency.id(for: T.self)
        self.storage = storage
    }
}

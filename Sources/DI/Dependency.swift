//
//  Dependency.swift
//
//  Created by Giorgi Kratsashvili on 11/23/22.
//

public final class Dependency {
    public typealias ID = String
    public typealias Initializer<T> = () -> T
    public enum InstanceType {
        case shared
        case new
    }

    let id: ID
    private let instanceType: InstanceType
    private let initializer: Initializer<Any>
    private var sharedInstance: Any?

    public init<T>(id: ID? = nil, instanceType: InstanceType = .shared, initializer: @escaping Initializer<T>) {
        self.id = id ?? Self.id(for: T.self)
        self.instanceType = instanceType
        self.initializer = initializer
    }

    func instance() -> Any {
        switch instanceType {
        case .shared:
            if let sharedInstance = sharedInstance {
                return sharedInstance
            } else {
                let instance = initializer()
                sharedInstance = instance
                return instance
            }
        case .new:
            return initializer()
        }
    }

    static func id<T>(for type: T.Type) -> ID {
        .init(describing: T.self)
    }
}

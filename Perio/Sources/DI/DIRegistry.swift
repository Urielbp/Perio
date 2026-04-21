//
//  DIRegistry.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 07/04/26.
//
// based on https://www.youtube.com/watch?v=ZZBoA0OM_sQ

@MainActor
final class DIRegistry {
    static let shared = DIRegistry()

    private init() { }

    private var resolvers: [String: (DIRegistry) -> Any] = [:]
    private var cache: [String: Any] = [:]

    func bind<Service>(service: Service.Type, resolver: @escaping (DIRegistry) -> Service) {
        let key = String(describing: Service.self)
        resolvers[key] = resolver
    }

    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = String(describing: Service.self)

        if let cached = cache[key] as? Service {
            return cached
        }

        guard let resolver = resolvers[key] else {
            fatalError("Service \(type) not found in DI registration phase")
        }

        guard let service = resolver(self) as? Service else {
            fatalError("Service \(type) type mismatch in DI registration phase")
        }
        cache[key] = service
        return service
    }
}

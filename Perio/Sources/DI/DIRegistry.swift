//
//  DIRegistry.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 07/04/26.
//
// based on https://www.youtube.com/watch?v=ZZBoA0OM_sQ

final class DIRegistry {
    static let shared = DIRegistry()

    private init() { }

    private var services: [String: Any] = [:]

    func bind<Service>(service: Service.Type, resolver: @escaping (DIRegistry) -> Service) {
        let key = String(describing: Service.self)
        self.services[key] = resolver(self)
    }

    func resolve<Service>(_ type: Service.Type) -> Service {
        let key = String(describing: Service.self)
        guard let service = services[key] as? Service else {
            fatalError("Service \(type) not found in DI registration phase")
        }
        return service
    }
}

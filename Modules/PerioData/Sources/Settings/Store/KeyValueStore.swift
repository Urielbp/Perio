//
//  KeyValueStore.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

import Foundation

public protocol KeyValueStore {
    func get<T: Codable>(_ key: String) -> T?
    func set<T: Codable>(_ value: T, for key: String)
    func remove(_ key: String)
}

public final class UserDefaultsKeyValueStore: KeyValueStore {
    let defaults: UserDefaults

    public init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }

    public func get<T>(_ key: String) -> T? where T : Decodable, T : Encodable {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(T.self, from: data)
    }

    public func set<T>(_ value: T, for key: String) where T : Decodable, T : Encodable {
        guard let data = try? JSONEncoder().encode(value) else { return }
        defaults.set(data, forKey: key)
    }

    public func remove(_ key: String) {
        defaults.removeObject(forKey: key)
    }
}

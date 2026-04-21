//
//  AppearanceMode.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public enum AppearanceMode: Codable {
    case darkMode
    case lightMode
    case systemSelected

    public static var typeName: String {
        String(describing: self)
    }
}

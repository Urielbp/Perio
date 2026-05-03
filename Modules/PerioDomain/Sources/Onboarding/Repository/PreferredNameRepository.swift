//
//  PreferredNameRepository.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

public protocol PreferredNameRepository {
    func setName(_ name: String)
    func observeName() -> AsyncStream<String?>
}

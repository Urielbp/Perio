//
//  SetPreferredNameUseCase.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 29/04/26.
//

public protocol SetPreferredNameUseCase {
    var repository: any PreferredNameRepository { get }

    func invoke(_ name: String)
}

public class SetPreferredNameUseCaseImpl: SetPreferredNameUseCase {

    public let repository: any PreferredNameRepository

    public init(repository: PreferredNameRepository) {
        self.repository = repository
    }

    public func invoke(_ name: String) {
        repository.setName(name)
    }
}

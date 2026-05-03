//
//  GetPreferredNameUseCase.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 03/05/26.
//

public protocol GetPreferredNameUseCase {
    var repository: any PreferredNameRepository { get }

    func invoke() -> AsyncStream<String?>
}

public class GetPreferredNameUseCaseImpl: GetPreferredNameUseCase {

    public let repository: any PreferredNameRepository

    public init(repository: PreferredNameRepository) {
        self.repository = repository
    }

    public func invoke() -> AsyncStream<String?> {
        repository.observeName()
    }
}

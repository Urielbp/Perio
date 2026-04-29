//
//  GetAppearanceModeUseCase.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public protocol GetAppearanceModeUseCase {
    var repository: any AppearanceRepository { get }

    func invoke() -> AsyncStream<AppearanceMode>
}

public class GetAppearanceModeUseCaseImpl: GetAppearanceModeUseCase {

    public let repository: any AppearanceRepository

    public init(repository: AppearanceRepository) {
        self.repository = repository
    }

    public func invoke() -> AsyncStream<AppearanceMode> {
        repository.observeMode()
    }
}

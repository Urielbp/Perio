//
//  SetAppearenceModeUseCase.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public protocol AppearanceRepository {
    func getCurrentMode() -> AppearanceMode
    func setMode(_ mode: AppearanceMode)
    func observeMode() -> AsyncStream<AppearanceMode>
}

public protocol SetAppearenceModeUseCase {
    var repository: any AppearanceRepository { get }

    func invoke(_ mode: AppearanceMode)
}

public class SetAppearenceModeUseCaseImpl: SetAppearenceModeUseCase {

    public let repository: any AppearanceRepository
    
    public init(repository: AppearanceRepository) {
        self.repository = repository
    }

    public func invoke(_ mode: AppearanceMode) {
        repository.setMode(mode)
    }
}

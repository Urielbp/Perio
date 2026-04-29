//
//  SetAppearanceModeUseCase.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 21/04/26.
//

public protocol SetAppearanceModeUseCase {
    var repository: any AppearanceRepository { get }

    func invoke(_ mode: AppearanceMode)
}

public class SetAppearanceModeUseCaseImpl: SetAppearanceModeUseCase {

    public let repository: any AppearanceRepository
    
    public init(repository: AppearanceRepository) {
        self.repository = repository
    }

    public func invoke(_ mode: AppearanceMode) {
        repository.setMode(mode)
    }
}

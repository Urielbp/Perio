//
//  ProfileViewModel.swift
//  Perio
//
//  Created by Uriel Barbosa Pinheiro on 03/05/26.
//

import SwiftUI
import PerioDomain

@MainActor
public protocol ProfileViewModel: Observable {
    var title: String { get }
    var subtitle: String { get }

    func observeName() async
}


@Observable
@MainActor
final public class ProfileViewModelImpl: ProfileViewModel {

    // MARK: - Private properties

    private let getPreferredNameUseCase: GetPreferredNameUseCase
    private var preferredName: String?

    // MARK: - Public properties

    public var title: String {
        preferredName ?? PerioPresentationStrings.Settings.Profile.noName
    }

    public var subtitle: String {
        preferredName != nil ? PerioPresentationStrings.Settings.Profile.cta : PerioPresentationStrings.Settings.Profile.noNameCta
    }

    // MARK: - Init

    public init(
        getPreferredNameUseCase: GetPreferredNameUseCase
    ) {
        self.getPreferredNameUseCase = getPreferredNameUseCase
    }

    // MARK: - Public functions

    public func observeName() async {
        for await name in getPreferredNameUseCase.invoke() {
            preferredName = name
        }
    }
}


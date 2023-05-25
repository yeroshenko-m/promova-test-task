//
//  AnimalRow.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalRow: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let animal: Animal
        var id: UUID { animal.id }
        var isPremium: Bool { animal.status == .paid }
        var isComingSoon: Bool { animal.status == .comingSoon }
    }

    enum Action: Equatable {
        case onAppear
        case selected(animal: Animal)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .onAppear, .selected:
            return .none
        }
    }
}

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

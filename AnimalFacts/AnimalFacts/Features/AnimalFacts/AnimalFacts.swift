//
//  AnimalFacts.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalFacts: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
        let title: String
        let facts: [AnimalFact]

        init(animal: Animal) {
            id = animal.id
            title = animal.title
            facts = animal.facts
        }
    }

    enum Action: Equatable {}

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        .none
    }
}

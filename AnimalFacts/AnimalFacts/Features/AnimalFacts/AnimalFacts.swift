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
        let facts: IdentifiedArrayOf<AnimalFactCell.State>
        var selected: Int

        init(animal: Animal) {
            id = animal.id
            title = animal.title

            let facts = animal.facts.enumerated().map { index, fact in
                AnimalFactCell.State(
                    fact: fact,
                    index: index,
                    isPreviuosButtonEnabled: index > 0,
                    isNextButtonEnabled: index < animal.facts.count - 1
                )
            }

            self.facts = IdentifiedArray(uniqueElements: facts)
            selected = 0
        }
    }

    enum Action: Equatable {
        case tabChanged(Int)
        case fact(index: AnimalFactCell.State.ID, action: AnimalFactCell.Action)
        case selectedIncremented
        case selectedDecremented
    }

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case let .tabChanged(index):
                state.selected = index
                return .none

            case let .fact(_, action):
                switch action {
                case .nextButtonTapped:
                    return .send((.selectedIncremented), animation: .interactiveSpring())

                case .previousButtonTapped:
                    return .send((.selectedDecremented), animation: .interactiveSpring())
                }

            case .selectedIncremented:
                let current = state.selected
                state.selected = current + 1
                return .none

            case .selectedDecremented:
                let current = state.selected
                state.selected = current - 1
                return .none
            }
        }
    }
}

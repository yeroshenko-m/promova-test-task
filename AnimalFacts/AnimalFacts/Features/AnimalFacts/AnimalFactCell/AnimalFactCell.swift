//
//  AnimalFactCell.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 26.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalFactCell: ReducerProtocol {
    struct State: Equatable, Identifiable {
        let id: UUID
        let index: Int
        let image: String
        let text: String
        let isPreviuosButtonEnabled: Bool
        let isNextButtonEnabled: Bool

        init(
            fact: AnimalFact,
            index: Int,
            isPreviuosButtonEnabled: Bool = true,
            isNextButtonEnabled: Bool = true
        ) {
            id = fact.id
            image = fact.image
            text = fact.fact
            self.index = index
            self.isPreviuosButtonEnabled = isPreviuosButtonEnabled
            self.isNextButtonEnabled = isNextButtonEnabled
        }
    }

    enum Action: Equatable {
        case previousButtonTapped(Int)
        case nextButtonTapped(Int)
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .previousButtonTapped, .nextButtonTapped:
            return .none
        }
    }
}

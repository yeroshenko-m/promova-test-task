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
    struct State: Equatable {
        let image: String
        let text: String
        let isPreviuosButtonEnabled: Bool
        let isNextButtonEnabled: Bool

        init(
            image: String,
            text: String,
            isPreviuosButtonEnabled: Bool = true,
            isNextButtonEnabled: Bool = true
        ) {
            self.image = image
            self.text = text
            self.isPreviuosButtonEnabled = isPreviuosButtonEnabled
            self.isNextButtonEnabled = isNextButtonEnabled
        }
    }

    enum Action: Equatable {
        case previousButtonTapped
        case nextButtonTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .previousButtonTapped, .nextButtonTapped:
            return .none
        }
    }
}

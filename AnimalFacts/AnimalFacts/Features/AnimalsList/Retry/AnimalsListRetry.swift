//
//  AnimalsListRetry.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalsListRetry: ReducerProtocol {
    struct State: Equatable {
        let error: AnimalsListError
    }

    enum Action: Equatable {
        case retryTapped
    }

    func reduce(into state: inout State, action: Action) -> EffectTask<Action> {
        switch action {
        case .retryTapped:
            return .none
        }
    }
}

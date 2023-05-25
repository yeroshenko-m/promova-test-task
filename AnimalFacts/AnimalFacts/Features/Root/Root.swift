//
//  Root.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct Root: ReducerProtocol {
    struct State: Equatable {
        var animalsList: AnimalsList.State
    }

    enum Action: Equatable {
        case animalsList(AnimalsList.Action)
    }

    var body: some ReducerProtocolOf<Self> {
        Scope(state: \.animalsList, action: /Action.animalsList) {
            AnimalsList()
        }
    }
}

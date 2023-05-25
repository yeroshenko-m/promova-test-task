//
//  AnimalRows.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalRows: ReducerProtocol {
    struct State: Equatable {
        var rows: IdentifiedArrayOf<AnimalRow.State> = []
    }

    enum Action: Equatable {
        case row(index: AnimalRow.State.ID, action: AnimalRow.Action)
    }

    var body: some ReducerProtocolOf<Self> {
        Reduce { _, _ in
            return .none
        }
        .forEach(\.rows, action: /Action.row) {
            AnimalRow()
        }
    }
}

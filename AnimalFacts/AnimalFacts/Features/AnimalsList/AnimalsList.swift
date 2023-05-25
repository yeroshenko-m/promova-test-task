//
//  AnimalsList.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalsList: ReducerProtocol {
    struct State: Equatable {
        var rows: IdentifiedArrayOf<AnimalRow.State> = []
        var isLoading: Bool = false
        var error: AnimalsListError?
    }

    enum Action: Equatable {
        case fetchAnimals
        case animalsResponse(TaskResult<[Animal]>)
        case row(index: AnimalRow.State.ID, action: AnimalRow.Action)
    }

    @Dependency(\.factsClient) var factsClient: AnimalFactsClient

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAnimals:
                state.isLoading = true
                return .run { send in
                    await send(.animalsResponse(TaskResult { try await factsClient.animals() }))
                }

            case let .animalsResponse(.success(animals)):
                let sortedAnimals = animals.sorted { $1.order > $0.order }
                state.rows = IdentifiedArray(uniqueElements: sortedAnimals.map { AnimalRow.State(animal: $0) })
                state.isLoading = false
                return .none

            case let .animalsResponse(.failure(error)):
                state.error = AnimalsListError.underlying(error)
                state.isLoading = false
                return .none

            case .row:
                return .none
            }
        }
        .forEach(\.rows, action: /Action.row) {
            AnimalRow()
        }
    }
}

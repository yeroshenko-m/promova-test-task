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
        var view: ViewState<AnimalRows.State, AnimalsListError>
    }

    enum Action: Equatable {
        case fetchAnimals
        case animalsResponse(TaskResult<[Animal]>)
        case rows(AnimalRows.Action)
    }

    @Dependency(\.factsClient) var factsClient: AnimalFactsClient

    var body: some ReducerProtocolOf<Self> {
        Reduce { state, action in
            switch action {
            case .fetchAnimals:
                state.view = .loading
                return .run { send in
                    await send(.animalsResponse(TaskResult { try await factsClient.animals() }))
                }

            case let .animalsResponse(.success(animals)):
                let rows = IdentifiedArray(uniqueElements: animals.map { AnimalRow.State(animal: $0) })
                state.view = .loaded(AnimalRows.State(rows: rows))
                return .none

            case let .animalsResponse(.failure(error)):
                state.view = .failed(AnimalsListError.underlying(error))
                return .none

            case .rows:
                return .none
            }
        }
        .ifLet(\.view.value, action: /Action.rows) {
            AnimalRows()
        }
    }
}

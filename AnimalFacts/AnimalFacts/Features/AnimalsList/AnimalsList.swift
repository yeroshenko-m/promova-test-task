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
        var animals: IdentifiedArrayOf<Animal> = []
        var retry: AnimalsListRetry.State?
        var selection: AnimalFacts.State?
        var alert: AlertState<Action>?
        var isWatchingAd: Bool = false
        var isLoading: Bool = false
    }

    enum Action: Equatable {
        case fetchAnimals
        case animalsResponse(TaskResult<[Animal]>)
        case retry(AnimalsListRetry.Action)
        case animalTapped(UUID)
        case navigationSelectionSet(UUID)
        case watchAdTapped(UUID)
        case adDismissed(UUID)
        case adWatched
        case alertDismissed
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
                state.animals = IdentifiedArray(uniqueElements: animals.sorted { $1.order > $0.order })
                state.isLoading = false
                return .none

            case let .animalsResponse(.failure(error)):
                state.retry = AnimalsListRetry.State(error: AnimalsListError.underlying(error))
                state.isLoading = false
                return .none

            case let .animalTapped(id):
                guard let animal = state.animals.first(where: { $0.id == id }) else { return .none }
                switch animal.status {
                case .free:
                    return .send(.navigationSelectionSet(id))

                case .paid:
                    state.alert = AlertState {
                        TextState("Watch Ad to continue")
                    } actions: {
                        ButtonState(action: .watchAdTapped(id)) {
                            TextState("Watch Ad")
                        }
                        ButtonState(action: .alertDismissed) {
                            TextState("Cancel")
                        }
                    }

                    return .none

                case .comingSoon:
                    state.alert = AlertState {
                        TextState("Facts for \(animal.title) are coming soon")
                    } actions: {
                        ButtonState(action: .alertDismissed) {
                            TextState("OK")
                        }
                    }

                    return .none
                }

            case let .navigationSelectionSet(id):
                guard let animal = state.animals.first(where: { $0.id == id }) else { return .none }
                state.selection = AnimalFacts.State(animal: animal)
                return .none

            case .alertDismissed:
                state.alert = nil
                return .none

            case let .retry(retryAction):
                switch retryAction {
                case .retryTapped:
                    return .send(.fetchAnimals)
                }

            case let .watchAdTapped(id):
                state.isWatchingAd = true
                return .run { send in
                    try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 3)
                    try? await Task.sleep(nanoseconds: Constants.adDuration)
                    await send(.adDismissed(id))
                }

            case let .adDismissed(id):
                state.isWatchingAd = false
                return .run { send in
                    try? await Task.sleep(nanoseconds: Constants.adDismissDelay)
                    await send(.navigationSelectionSet(id))
                }

            case .adWatched:
                return .none
            }
        }
        .ifLet(\.retry, action: /Action.retry) {
            AnimalsListRetry()
        }
    }
}

// MARK: - AnimalCategoriesList + Constants {

extension AnimalsList {
    struct Constants {
        static let adDuration: UInt64 = NSEC_PER_SEC * 3
        static let adDismissDelay: UInt64 = NSEC_PER_SEC / 2
    }
}

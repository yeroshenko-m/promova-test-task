//
//  AnimalFactsClient.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import Foundation

struct AnimalFactsClient {
    var animals: @Sendable () async throws -> [Animal]
}

// MARK: - AnimalFactsClient + DependencyValues

extension DependencyValues {
    var factsClient: AnimalFactsClient {
        get { self[AnimalFactsClient.self] }
        set { self[AnimalFactsClient.self] = newValue }
    }
}

// MARK: - AnimalsContentProvider + DependencyKey

extension AnimalFactsClient: DependencyKey {
    static var liveValue: AnimalFactsClient {
        AnimalFactsClient {
            let (data, _) = try await URLSession.shared.data(from: AnimalsFactsAPI.url)
            return try JSONDecoder().decode([Animal].self, from: data)
        }
    }

    static var testValue: AnimalFactsClient {
        AnimalFactsClient {
            unimplemented("\(AnimalFactsClient.self).animals")
        }
    }
}

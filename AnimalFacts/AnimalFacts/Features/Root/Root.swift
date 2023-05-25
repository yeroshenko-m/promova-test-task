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
        
    }

    enum Action: Equatable {
        
    }

    var body: some ReducerProtocolOf<Self> {
        EmptyReducer()
    }
}

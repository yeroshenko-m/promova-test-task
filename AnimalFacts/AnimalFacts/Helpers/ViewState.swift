//
//  ViewState.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

enum ViewState<V: Equatable, E: Error>: Equatable where E: Equatable {
    case loaded(_ value: V)
    case loading
    case failed(_ error: E)
}

extension ViewState {
    var value: V? {
        get {
            switch self {
            case let .loaded(value):
                return value
            case .loading:
                return nil
            case .failed:
                return nil
            }
        }
        set {
            guard let newValue else {
                return
            }

            switch self {
            case .loaded:
                self = .loaded(newValue)
            case .loading: ()
            case .failed: ()
            }
        }
    }
}

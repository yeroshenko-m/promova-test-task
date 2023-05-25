//
//  AnimalsListError.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

enum AnimalsListError: Error, Equatable {
    case underlying(Error)

    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case (.underlying(let lhsError), .underlying(let rhsError)):
            return lhsError.localizedDescription == rhsError.localizedDescription
        }
    }
}

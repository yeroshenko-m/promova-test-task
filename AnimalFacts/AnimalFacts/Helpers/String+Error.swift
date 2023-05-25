//
//  String+Error.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

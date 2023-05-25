//
//  AnimalFact.swift
//  PromovaTestTask
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

struct AnimalFact {
    let id: UUID
    let fact: String
    let image: String
}

// MARK: - AnimalFact + Identifiable

extension AnimalFact: Identifiable {}

// MARK: - AnimalFact + Equatable

extension AnimalFact: Equatable {}

// MARK: - AnimalFact + Decodable

extension AnimalFact: Decodable {
    enum CodingKeys: String, CodingKey {
        case fact
        case image
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.fact = try container.decode(String.self, forKey: .fact)
        self.image = try container.decode(String.self, forKey: .image)
        self.id = UUID()
    }
}

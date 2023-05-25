//
//  Animal.swift
//  PromovaTestTask
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

struct Animal {
    let id: UUID
    let title: String
    let description: String
    let image: String
    let order: Int
    let status: Status
    let facts: [AnimalFact]
}

// MARK: - Animal + Identifiable

extension Animal: Identifiable {}

// MARK: - Animal + Equatable

extension Animal: Equatable {}

// MARK: - Animal.Status

extension Animal {
    enum Status: String, Decodable {
        case paid
        case free
        case comingSoon
    }
}

// MARK: - Animal + Decodable

extension Animal: Decodable {
    enum CodingKeys: String, CodingKey {
        case title
        case description
        case image
        case order
        case status
        case content
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.description = try container.decode(String.self, forKey: .description)
        self.image = try container.decode(String.self, forKey: .image)
        self.order = try container.decode(Int.self, forKey: .order)
        self.facts = try container.decodeIfPresent([AnimalFact].self, forKey: .content) ?? []
        self.status = facts.isEmpty ? .comingSoon : try container.decode(Status.self, forKey: .status)
        self.id = UUID()
    }
}

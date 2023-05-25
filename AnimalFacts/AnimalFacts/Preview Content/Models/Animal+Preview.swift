//
//  Animal+Preview.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

extension Animal {
    private static var baseURL: String {
        "https://upload.wikimedia.org/wikipedia/commons/thumb"
    }

    static var elephant: Animal {
        Animal(
            id: UUID(),
            title: "Elephant",
            description: "Some interesting facts about elephants",
            image: "\(baseURL)/4/43/Angry_elephant_ears.jpg/220px-Angry_elephant_ears.jpg",
            order: 1,
            status: .free,
            facts: AnimalFact.elephants
        )
    }

    static var crocodile: Animal {
        Animal(
            id: UUID(),
            title: "Crocodile",
            description: "Some interesting and terryfying facts about crocodiles",
            image: "\(baseURL)/b/bd/Nile_crocodile_head.jpg/220px-Nile_crocodile_head.jpg",
            order: 3,
            status: .paid,
            facts: AnimalFact.crocodiles
        )
    }

    static var bug: Animal {
        Animal(
            id: UUID(),
            title: "Bug",
            description: "A few interesting facts about the bugs (alive ones)",
            image: "\(baseURL)/c/c2/Notonecta_glauca01.jpg/220px-Notonecta_glauca01.jpg",
            order: 2,
            status: .comingSoon,
            facts: []
        )
    }
}

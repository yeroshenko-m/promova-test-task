//
//  AnimalFact+Preview.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

extension AnimalFact {
    private static var baseURL: String {
        "https://upload.wikimedia.org/wikipedia/commons/thumb"
    }

    static var elephants: [AnimalFact] {
        [
            AnimalFact(
                id: UUID(),
                fact: "The elephant's skull can weigh up to 600 pounds (272 kilograms).",
                image: "\(baseURL)/e/e7/Elephant_skeleton.jpg/220px-Elephant_skeleton.jpg"
            ),
            AnimalFact(
                id: UUID(),
                fact: "Elephants are the largest land mammals, with males weighing up to 12,000 pounds(5,400 kilos).",
                image: "\(baseURL)/f/f3/Loxodontacyclotis.jpg/200px-Loxodontacyclotis.jpg"
            )
        ]
    }

    static var crocodiles: [AnimalFact] {
        [
            AnimalFact(
                id: UUID(),
                fact: "Crocodile eggs have a strong shell that can withstand the weight of an adult crocodile.",
                image: "\(baseURL)/1/1f/Nile_crocodile_eggs.jpg/220px-Nile_crocodile_eggs.jpg"
            ),
            AnimalFact(
                id: UUID(),
                fact: "Crocodiles can go without eating for several months due to their slow metabolism.",
                image: "\(baseURL)/b/bd/Crocodiles_resting_together.jpeg/220px-Crocodiles_resting_together.jpeg"
            )
        ]
    }
}

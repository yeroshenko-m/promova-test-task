//
//  AnimalFactsApp.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

@main
struct AnimalFactsApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(store: Store(initialState: Root.State(), reducer: Root()))
        }
    }
}

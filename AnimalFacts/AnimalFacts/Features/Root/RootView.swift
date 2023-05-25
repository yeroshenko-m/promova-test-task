//
//  RootView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: StoreOf<Root>

    var body: some View {
        NavigationView {
            WithViewStore(self.store) { _ in
                AnimalsListView(store: self.store.scope(state: \.animalsList, action: Root.Action.animalsList))
            }
        }
        .tint(.black)
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

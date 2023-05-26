//
//  AnimalFactsView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

struct AnimalFactsView: View {
    let store: StoreOf<AnimalFacts>

    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            ZStack {
                Constants.backgroundColor
                    .ignoresSafeArea()

                VStack {
                    PagedView(
                        pageCount: viewStore.facts.count,
                        currentIndex: viewStore.binding(
                            get: \.selected,
                            send: AnimalFacts.Action.tabChanged
                        )
                    ) {
                        ForEachStore(
                            self.store.scope(
                                state: \.facts,
                                action: AnimalFacts.Action.fact
                            )
                        ) { cellStore in
                            AnimalFactCellView(store: cellStore)
                                .padding(Constants.padding)
                        }
                    }
                }
            }
        }
        .foregroundColor(.black)
    }
}

#if DEBUG
    struct AnimalFactsView_Previews: PreviewProvider {
        static var previews: some View {
            NavigationView {
                AnimalFactsView(
                    store: Store(
                        initialState: AnimalFacts.State(animal: .elephant),
                        reducer: AnimalFacts.init
                    )
                )
            }
        }
    }
#endif

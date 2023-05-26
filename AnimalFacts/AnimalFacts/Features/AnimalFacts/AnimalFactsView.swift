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

extension AnimalFactsView {
    struct Constants {
        static let backgroundColor: Color = Color(hexString: "#BEC8FF")
        static let backButtonImage: String = "arrow.left"
        static let backButtonColor: Color = .black
        static let padding: EdgeInsets = EdgeInsets(top: 50.0, leading: 20.0, bottom: 100.0, trailing: 20.0)
    }
}

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

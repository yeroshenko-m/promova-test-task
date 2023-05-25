//
//  AnimalsListView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

struct AnimalsListView: View {
    let store: StoreOf<AnimalsList>

    var body: some View {
        ZStack {
            Constants.backgroundColor.ignoresSafeArea()
            content
        }
    }

    @ViewBuilder
    private var content: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            ZStack {
                animalsList(with: viewStore)

                retryView(with: viewStore)

                if viewStore.isLoading {
                    ProgressView()
                        .scaleEffect(Constants.loaderScale)
                }
            }
            .onAppear { viewStore.send(.fetchAnimals) }
            .alert(
                self.store.scope(state: \.alert, action: { $0 }),
                dismiss: .alertDismissed
            )
            .fullScreenCover(
                isPresented: viewStore.binding(
                    get: \.isWatchingAd,
                    send: .adWatched
                )
            ) {
                AdView()
            }
        }
    }

    @ViewBuilder
    private func animalsList(with viewStore: ViewStoreOf<AnimalsList>) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Constants.rowsVerticalPadding) {
                ForEach(viewStore.animals) { animal in
                    animalRow(with: animal, viewStore: viewStore)
                }
            }
            .padding(Constants.rowsHorizontalPadding)
        }
        .navigationTitle("Animal facts")
        .navigationBarTitleDisplayMode(.inline)
    }

    @ViewBuilder
    private func retryView(with viewStore: ViewStoreOf<AnimalsList>) -> some View {
        IfLetStore(
            self.store.scope(
                state: \.retry,
                action: AnimalsList.Action.retry
            )
        ) { retryStore in
            AnimalsListRetryView(store: retryStore)
        }
    }

    @ViewBuilder
    private func animalRow(
        with animal: Animal,
        viewStore: ViewStoreOf<AnimalsList>
    ) -> some View {
        NavigationLink(
            destination: IfLetStore(
                self.store.scope(
                    state: \.selection,
                    action: AnimalsList.Action.facts
                )) { factsStore in
                    AnimalFactsView(store: factsStore)
                },
            tag: animal.id,
            selection: viewStore.binding(
                get: \.selection?.id,
                send: AnimalsList.Action.animalTapped(animal.id)
            )
        ) {
            AnimalRowView(animal: animal)
        }
    }
}

extension AnimalsListView {
    struct Constants {
        static let rowsHorizontalPadding: CGFloat = 16.0
        static let rowsVerticalPadding: CGFloat = 16.0
        static let backgroundColor: Color = Color(hexString: "#BEC8FF")
        static let loaderScale: CGFloat = 2.0
    }
}

struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

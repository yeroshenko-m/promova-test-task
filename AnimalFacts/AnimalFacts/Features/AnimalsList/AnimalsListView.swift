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
        }
    }

    @ViewBuilder
    private func animalsList(with viewStore: ViewStoreOf<AnimalsList>) -> some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: Constants.rowsVerticalPadding) {
                ForEachStore(
                    self.store.scope(
                        state: \.rows,
                        action: AnimalsList.Action.row(index:action:)
                    )
                ) { rowStore in
                    AnimalRowView(store: rowStore)
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

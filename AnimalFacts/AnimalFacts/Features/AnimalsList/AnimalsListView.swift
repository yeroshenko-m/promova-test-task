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
                if let error = viewStore.error {
                    Text(error.localizedDescription)
                } else if viewStore.isLoading {
                    ProgressView()
                } else {
                    animalsList(with: viewStore)
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
        .navigationTitle("Select a category")
        .navigationBarTitleDisplayMode(.inline)
    }
}

extension AnimalsListView {
    struct Constants {
        static let rowsHorizontalPadding: CGFloat = 16.0
        static let rowsVerticalPadding: CGFloat = 16.0
        static let backgroundColor: Color = Color(hexString: "#BEC8FF")
    }
}

struct AnimalsListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyView()
    }
}

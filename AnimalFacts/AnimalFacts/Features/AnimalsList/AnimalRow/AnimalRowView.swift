//
//  AnimalRowView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

struct AnimalRowView: View {
    let store: StoreOf<AnimalRow>

    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            ZStack {
                rowContent(with: viewStore)

                if viewStore.isComingSoon {
                    ComingSoonView()
                }
            }
            .frame(height: Constants.Cell.height)
            .cornerRadius(Constants.Cell.cornerRadius)
        }
    }

    @ViewBuilder
    private func rowContent(with viewStore: ViewStoreOf<AnimalRow>) -> some View {
        HStack(alignment: .top, spacing: .zero) {
            image(with: viewStore.animal.image)
            content(with: viewStore)
            Spacer(minLength: Constants.Content.trailingPadding)
        }
        .background(Constants.Colors.background)
    }

    @ViewBuilder
    private func image(with urlString: String) -> some View {
        AsyncImage(
            url: urlString.asURL()) {
                $0.resizable()
            } placeholder: {
                imagePlaceholder
            }
            .aspectRatio(contentMode: .fill)
            .frame(width: Constants.Picture.width, height: Constants.Picture.height)
            .cornerRadius(Constants.Picture.cornerRadius)
            .padding([.top, .leading, .bottom], Constants.Picture.padding)
    }

    @ViewBuilder
    private var imagePlaceholder: some View {
        ZStack {
            Rectangle()
                .fill(Constants.Colors.placeholder)
            ProgressView()
        }
    }

    @ViewBuilder
    private func content(with viewStore: ViewStoreOf<AnimalRow>) -> some View {
        VStack(alignment: .leading) {
            Text(viewStore.animal.title)
                .font(Constants.Fonts.title)
                .foregroundColor(Constants.Colors.title)
            Text(viewStore.animal.description)
                .font(Constants.Fonts.description)
                .foregroundColor(Constants.Colors.description)
            Spacer()

            if viewStore.isPremium {
                premiumLabel
            }
        }
        .lineLimit(Constants.Content.lineLimit)
        .padding(.vertical, Constants.Content.verticalPadding)
        .padding(.leading, Constants.Content.leadingPadding)
    }

    @ViewBuilder
    private var premiumLabel: some View {
        HStack {
            Spacer()
            Text("\(Image(systemName: Constants.Picture.premiumBadge)) \(Constants.Content.premiumLabelText)")
                .foregroundColor(Constants.Colors.premiumLabel)
        }
    }

}

struct AnimalRowView_Previews: PreviewProvider {
    static var previews: some View {
        AnimalRowView(store: Store(initialState: AnimalRow.State(animal: .elephant), reducer: AnimalRow.init))
    }
}

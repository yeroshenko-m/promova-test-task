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
    let animal: Animal

    var body: some View {
        ZStack {
            rowContent

            if animal.status == .comingSoon {
                ComingSoonView()
            }
        }
        .frame(height: Constants.Cell.height)
        .cornerRadius(Constants.Cell.cornerRadius)
    }

    @ViewBuilder
    private var rowContent: some View {
        HStack(alignment: .top, spacing: .zero) {
            image
            content
            Spacer(minLength: Constants.Content.trailingPadding)
        }
        .background(Constants.Colors.background)
    }

    @ViewBuilder
    private var image: some View {
        AsyncImage(
            url: animal.image.asURL()) {
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
    private var content: some View {
        VStack(alignment: .leading) {
            Text(animal.title)
                .font(Constants.Fonts.title)
                .foregroundColor(Constants.Colors.title)
            Text(animal.description)
                .font(Constants.Fonts.description)
                .foregroundColor(Constants.Colors.description)
            Spacer()

            if animal.status == .paid {
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

#if DEBUG
    struct AnimalRowView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalRowView(animal: .elephant)
        }
    }
#endif

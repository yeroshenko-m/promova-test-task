//
//  AnimalFactCellView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 26.05.2023
//

import ComposableArchitecture
import SwiftUI

struct AnimalFactCellView: View {
    let store: StoreOf<AnimalFactCell>

    var body: some View {
        WithViewStore(self.store) { $0 } content: { viewStore in
            GeometryReader { proxy in
                VStack(alignment: .center) {
                    image(
                        with: viewStore.image,
                        height: proxy.size.height
                    )

                    title(with: viewStore.text)

                    Spacer()

                    buttons(with: viewStore)
                }
                .background(Constants.Cell.backgroundColor)
                .cornerRadius(Constants.Cell.cornerRadius)
            }
        }
    }

    @ViewBuilder
    private func image(
        with url: String,
        height: CGFloat
    ) -> some View {
        AsyncImage(
            url: url.asURL()) {
                $0.resizable()
            } placeholder: {
                imagePlaceholder
            }
            .frame(height: height * Constants.Picture.heightMultiplier)
            .aspectRatio(contentMode: .fill)
            .fixedSize(horizontal: false, vertical: true)
            .cornerRadius(Constants.Picture.cornerRadius)
            .clipped()
            .padding(Constants.Picture.padding)
    }

    @ViewBuilder
    private var imagePlaceholder: some View {
        ZStack {
            Rectangle()
                .fill(Color(uiColor: .systemGray5))
            ProgressView()
        }
    }

    @ViewBuilder
    private func title(with text: String) -> some View {
        Text(text)
            .font(Constants.Title.font)
            .padding(.horizontal, Constants.Title.horizontalPadding)
            .padding(.top, Constants.Title.topPadding)
            .lineLimit(Constants.Title.linesCount)
            .multilineTextAlignment(.center)
    }

    @ViewBuilder
    private func buttons(with viewStore: ViewStoreOf<AnimalFactCell>) -> some View {
        HStack {
            Button {
                viewStore.send(.previousButtonTapped(viewStore.index))
            } label: {
                button(with: Constants.Buttons.previousImage)
            }
            .disabled(!viewStore.isPreviuosButtonEnabled)
            .foregroundColor(
                viewStore.isPreviuosButtonEnabled ? Constants.Buttons.enabledColor : Constants.Buttons.disabledColor
            )

            Spacer()

            Button {
                viewStore.send(.nextButtonTapped(viewStore.index))
            } label: {
                button(with: Constants.Buttons.nextImage)
            }
            .disabled(!viewStore.isNextButtonEnabled)
            .foregroundColor(
                viewStore.isNextButtonEnabled ? Constants.Buttons.enabledColor : Constants.Buttons.disabledColor
            )
        }
        .padding(Constants.Buttons.padding)
    }

    @ViewBuilder
    private func button(with image: String) -> some View {
        ZStack {
            Circle()
                .stroke(lineWidth: Constants.Buttons.strokeWidth)
            Image(systemName: image)
                .font(Constants.Buttons.font)
        }
        .frame(width: Constants.Buttons.width)
    }
}

struct AnimalFactCellView_Previews: PreviewProvider {
    static let animal = AnimalFact.elephants[0]

    static var previews: some View {
        AnimalFactCellView(
            store: Store(
                initialState: AnimalFactCell.State(fact: animal, index: 0, isPreviuosButtonEnabled: false),
                reducer: AnimalFactCell())
        )
        .padding(
            EdgeInsets(
                top: 50,
                leading: 20,
                bottom: 100,
                trailing: 20
            )
        )
        .background(.blue)
    }
}

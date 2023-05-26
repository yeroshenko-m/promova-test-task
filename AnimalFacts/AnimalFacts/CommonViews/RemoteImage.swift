//
//  RemoteImage.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 26.05.2023
//

import SwiftUI

struct RemoteImage: View {
    let urlString: String

    var body: some View {
        AsyncImage(url: urlString.asURL()) { phase in
            switch phase {
            case .empty:
                imagePlaceholder
            case .failure:
                Image(Constants.placeholderImage)
                    .resizable()
            case let .success(image):
                image.resizable()
            @unknown default:
                EmptyView()
            }
        }
    }

    @ViewBuilder
    private var imagePlaceholder: some View {
        ZStack {
            Rectangle()
                .fill(Constants.backgroundColor)
            ProgressView()
        }
    }
}

extension RemoteImage {
    struct Constants {
        static let placeholderImage: String = "placeholder"
        static let backgroundColor: Color = Color(uiColor: .systemGray5)
    }
}

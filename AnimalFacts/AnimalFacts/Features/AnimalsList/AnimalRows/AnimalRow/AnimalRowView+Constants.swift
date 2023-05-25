//
//  AnimalRowView+Constants.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation
import SwiftUI

extension AnimalRowView {
    // swiftlint:disable nesting
    struct Constants {
        struct Colors {
            static let title: Color = .black
            static let description: Color = .black.opacity(0.5)
            static let placeholder: Color = .gray.opacity(0.7)
            static let premiumLabel: Color = .blue
            static let background: Color = .white
        }

        struct Picture {
            static let width: CGFloat = 120.0
            static let height: CGFloat = 90.0
            static let padding: CGFloat = 5.0
            static let cornerRadius: CGFloat = 6.0
            static let premiumBadge: String = "lock.fill"
        }

        struct Fonts {
            static let title: Font = .custom("Basic", size: 17.0)
            static let description: Font = .custom("Basic", size: 12.0)
        }

        struct Content {
            static let verticalPadding: CGFloat = 10.0
            static let trailingPadding: CGFloat = 16.0
            static let leadingPadding: CGFloat = 16.0
            static let lineLimit: Int = 2
            static let premiumLabelText: String = "Premium"
        }

        struct Cell {
            static let height: CGFloat = 100.0
            static let cornerRadius: CGFloat = 6.0
        }
    }
    // swiftlint:enable nesting
}

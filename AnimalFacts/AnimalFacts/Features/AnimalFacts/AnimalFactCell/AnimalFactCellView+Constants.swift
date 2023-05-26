//
//  AnimalFactCellView+Constants.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 26.05.2023
//

import Foundation
import SwiftUI

extension AnimalFactCellView {
    // swiftlint:disable nesting
    struct Constants {
        struct Buttons {
            static let nextImage: String = "chevron.right"
            static let previousImage: String = "chevron.left"
            static let strokeWidth: CGFloat = 3.0
            static let font: Font = .system(size: 22.0, weight: .semibold)
            static let width: CGFloat = 55.0
            static let padding: CGFloat = 20.0
            static let enabledColor: Color = .black
            static let disabledColor: Color = .gray
        }

        struct Picture {
            static let cornerRadius: CGFloat = 6.0
            static let heightMultiplier: CGFloat = 0.5
            static let padding: EdgeInsets = EdgeInsets(top: 5.0, leading: 5.0, bottom: .zero, trailing: 5.0)
        }

        struct Title {
            static let font: Font = .custom("Basic", size: 17.0)
            static let horizontalPadding: CGFloat = 5.0
            static let topPadding: CGFloat = 17.0
            static let linesCount: Int = 5
            static let textColor: Color = .black
        }

        struct Cell {
            static let cornerRadius: CGFloat = 6.0
            static let backgroundColor: Color = .white
        }
    }
    // swiftlint:enable nesting
}

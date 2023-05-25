//
//  ComingSoonView.swift
//  PromovaTestTask
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import SwiftUI

struct ComingSoonView: View {
    var body: some View {
        ZStack {
            Constants.backgroundColor
                .opacity(Constants.backgroundOpdacity)
            label
        }
    }

    @ViewBuilder
    private var label: some View {
        HStack {
            Spacer()
            Image(Constants.image)
                .resizable()
                .scaledToFit()
        }
    }
}

// MARK: - ComingSoonView + Constants

extension ComingSoonView {
    struct Constants {
        static let backgroundColor: Color = .black
        static let backgroundOpdacity: CGFloat = 0.7
        static let image: String = "coming-soon"
    }
}

struct ComingSoonView_Previews: PreviewProvider {
    static var previews: some View {
        ComingSoonView()
            .frame(height: 100)
    }
}

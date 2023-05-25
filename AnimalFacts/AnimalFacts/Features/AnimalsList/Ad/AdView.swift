//
//  AdView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import SwiftUI

struct AdView: View {
    var body: some View {
        ZStack {
            Color.black
                .opacity(Constants.backgroundOpacity)
                .ignoresSafeArea()
            ProgressView()
                .scaleEffect(Constants.loaderScale)
        }
    }
}

// MARK: - AdView + Constants

extension AdView {
    struct Constants {
        static let backgroundOpacity: CGFloat = 0.5
        static let loaderScale: CGFloat = 2.0
    }
}

struct AdView_Previews: PreviewProvider {
    static var previews: some View {
        AdView()
    }
}

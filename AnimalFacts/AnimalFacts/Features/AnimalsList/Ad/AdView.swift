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

#if DEBUG
    struct AdView_Previews: PreviewProvider {
        static var previews: some View {
            AdView()
        }
    }
#endif

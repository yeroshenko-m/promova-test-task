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

#if DEBUG
    struct ComingSoonView_Previews: PreviewProvider {
        static var previews: some View {
            ComingSoonView()
                .frame(height: 100)
        }
    }
#endif

//
//  AnimalsListRetryView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import ComposableArchitecture
import SwiftUI

struct AnimalsListRetryView: View {
    let store: StoreOf<AnimalsListRetry>

    var body: some View {
        WithViewStore(self.store, observe: \.error) { viewStore in
            VStack {
                Spacer()
                Text("Facts loaing failed ☹️")
                    .font(Constants.titleFont)
                    .foregroundColor(Constants.titleColor)
                Spacer()
                Button {
                    viewStore.send(.retryTapped)
                } label: {
                    Text("Retry")
                        .foregroundColor(Constants.buttonTitleColor)
                        .frame(maxWidth: .infinity)
                        .frame(height: Constants.buttonHeight)
                        .background(Constants.buttonColor)
                        .cornerRadius(Constants.cornerRadius)
                        .padding(.horizontal, Constants.buttonPadding)
                }
                .padding(.bottom, Constants.buttonPadding)
            }
        }
    }
}

#if DEBUG
    struct AnimalsListRetryView_Previews: PreviewProvider {
        static var previews: some View {
            AnimalsListRetryView(
                store: Store(initialState: AnimalsListRetry.State(error: .underlying("")),
                             reducer: AnimalsListRetry())
            )
        }
    }
#endif

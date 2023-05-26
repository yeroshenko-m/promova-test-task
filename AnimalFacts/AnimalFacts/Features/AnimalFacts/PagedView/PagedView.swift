//
//  PagedView.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 26.05.2023
//

import SwiftUI

struct PagedView<Content: View>: View {
    let pageCount: Int
    @Binding var currentIndex: Int
    let content: Content

    @GestureState private var translation: CGFloat = .zero

    init(
        pageCount: Int,
        currentIndex: Binding<Int>,
        @ViewBuilder content: () -> Content
    ) {
        self.pageCount = pageCount
        self._currentIndex = currentIndex
        self.content = content()
    }

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: .zero) {
                self.content.frame(width: geometry.size.width)
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geometry.size.width)
            .offset(x: translation)
            .gesture(
                DragGesture().updating(self.$translation) { value, state, _ in
                    state = value.translation.width
                }.onEnded { value in
                    let offset = value.translation.width / geometry.size.width
                    let newIndex = (CGFloat(currentIndex) - offset).rounded()
                    self.currentIndex = min(max(Int(newIndex), .zero), pageCount - 1)
                }
            )
            .animation(.easeInOut, value: currentIndex)
        }
    }
}

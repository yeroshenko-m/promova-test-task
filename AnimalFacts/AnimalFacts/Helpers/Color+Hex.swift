//
//  Color+Hex.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import SwiftUI

extension Color {
    init(hexString: String, opacity: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)

        if hexString.hasPrefix("#") {
            scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
        }

        var color: UInt64 = 0
        scanner.scanHexInt64(&color)
        let mask = 0x0000_00FF

        let red = Int(color >> 16) & mask
        let green = Int(color >> 8) & mask
        let blue = Int(color) & mask

        let redColor = CGFloat(red) / 255.0
        let greenColor = CGFloat(green) / 255.0
        let blueColor = CGFloat(blue) / 255.0

        self.init(red: redColor, green: greenColor, blue: blueColor, opacity: opacity)
    }
}

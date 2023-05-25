//
//  String+URL.swift
//  AnimalFacts
//
//  Author:  Mykhailo Yeroshenko
//  Created: 25.05.2023
//

import Foundation

extension String {
    func asURL() -> URL? { URL(string: self) }
}

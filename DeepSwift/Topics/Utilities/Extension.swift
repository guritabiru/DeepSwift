//
//  Extension.swift
//  DeepSwift
//
//  Created by Bimo Sekti Wicaksono on 24/08/23.
//

import Foundation

extension String {
    func uppercasedFirst() -> String {
        let firstCharacter = prefix(1).capitalized
        let remainingCharacters = dropFirst().lowercased()
        return firstCharacter + remainingCharacters
    }
}

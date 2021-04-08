//
//  Localize.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 06/04/2021.
//

import Foundation

class Localize {
    
    private init() {}
    
    static func text(_ text: LocalizableStrings) -> String {
        
        return NSLocalizedString(text.rawValue, comment: "")
    }
    
    enum LocalizableStrings: String {
        // Main app
        case BookList
        case ISBN
        case By
        // Alert message
        case Alert
        case ErrorMessage
        case OK
    }
}

//
//  Book.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import Foundation

struct Book: Decodable {
    var id: Int
    var title: String
    var isbn: String
    var bookDescription: String?
    var price: Int
    var currencyCode: String
    var author: String
    
    private enum CodingKeys : String, CodingKey {
        case id
        case title
        case isbn
        case bookDescription = "description"
        case price
        case currencyCode
        case author
    }
}

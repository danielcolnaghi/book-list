//
//  Router.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import Foundation

enum APIRouter {
    
    typealias Headers = [String: String?]
    case getBookList
    case getSingleBook(id: Int)
    
    var scheme: String {
        switch self {
        case .getBookList, .getSingleBook:
            return "http"
        }
    }
    
    var host: String {
        switch self {
        case .getBookList, .getSingleBook:
            return "tpbookserver.herokuapp.com"
        }
    }
    
    private var version: String {
        switch self {
        case .getBookList, .getSingleBook:
            return ""
        }
    }
    
    var path: String {
        switch self {
        case .getBookList:
            return "\(self.version)/books"
        case .getSingleBook(let id):
            return "\(self.version)/book/\(id)"
        }
    }
    
    var headers: Headers? {
        switch self {
        case .getBookList, .getSingleBook:
            return nil
        }
    }
    
    var method: String {
        switch self {
        case .getBookList, .getSingleBook:
            return "GET"
        }
    }
}


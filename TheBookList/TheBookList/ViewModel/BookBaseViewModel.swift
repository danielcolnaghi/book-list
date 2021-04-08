//
//  BookBaseViewModel.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import Foundation

class BookBaseViewModel {
    
    @Published var model: Book!
    
    init(model: Book) {
        self.model = model
    }
    
    var title: String {
        return model.title
    }
    
    var isbn: String {
        return "\(Localize.text(.ISBN)) \(model.isbn)"
    }
    
    var description: String {
        return model.bookDescription ?? ""
    }
    
    var price: String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.maximumFractionDigits = 2
        formater.numberStyle = .currency
        formater.currencyCode = model.currencyCode

        return formater.string(from: NSNumber(value: Double(model.price)/100)) ?? ""
    }
    
    var author: String {
        return "\(Localize.text(.By)) \(model.author)"
    }
}

//
//  BookModelTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import XCTest
@testable import TheBookList

class BookModelTests: XCTestCase {
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testBook() throws {
        // Given
        var book: Book!
        
        // When
        book = Book(id: 8, title: "The Book List", isbn: "123321", bookDescription: "The Book List Description", price: 1234, currencyCode: "EUR", author: "Daniel")
        
        // Then
        XCTAssertEqual(book.id, 8)
        XCTAssertEqual(book.title, "The Book List")
        XCTAssertEqual(book.isbn, "123321")
        XCTAssertEqual(book.bookDescription, "The Book List Description")
        XCTAssertEqual(book.price, 1234)
        XCTAssertEqual(book.currencyCode, "EUR")
        XCTAssertEqual(book.author, "Daniel")
    }
}

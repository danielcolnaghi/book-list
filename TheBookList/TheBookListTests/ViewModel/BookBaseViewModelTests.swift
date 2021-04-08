//
//  BookBaseViewModelTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 03/04/2021.
//

import XCTest
@testable import TheBookList

class BookBaseViewModelTests: XCTestCase {

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testBookDetails() throws {
        // Given
        let book = Book(id: 1, title: "The Book", isbn: "123-321", bookDescription: "This is a book description lads.", price: 5999, currencyCode: "USD", author: "Daniel")
        
        // When
        let viewModel = BookBaseViewModel(model: book)
        
        // Then
        XCTAssertEqual(viewModel.title, "The Book")
        XCTAssertEqual(viewModel.isbn, "ISBN: 123-321")
        XCTAssertEqual(viewModel.description, "This is a book description lads.")
        XCTAssertEqual(viewModel.price, "$59.99")
        XCTAssertEqual(viewModel.author, "by Daniel")
    }
}


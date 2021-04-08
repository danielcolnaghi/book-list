//
//  BookDetailsViewModelTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 03/04/2021.
//

import XCTest
@testable import TheBookList

class BookDetailsViewModelTests: XCTestCase {

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testBookDetails() throws {
        // Given
        let apiService = MockedAPIService()
        let book = Book(id: 100, title: "", isbn: "", bookDescription: "", price: 0, currencyCode: "", author: "")
        
        let viewModel = BookDetailsViewModel(apiService: apiService, model: book)
        
        // When
        viewModel.start()
        
        // Then
        XCTAssertNotEqual(viewModel.description, "")
    }
}

//
//  BookListViewModelTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 03/04/2021.
//

import XCTest
@testable import TheBookList

class BookListViewModelTests: XCTestCase {

    override func tearDownWithError() throws {
        super.tearDown()
    }

    func testBookList() throws {
        // Given
        let apiService = MockedAPIService()
        let viewModel = BookListViewModel(apiService: apiService)
        
        // When
        viewModel.start()
        
        // Then
        XCTAssertEqual(viewModel.books.count, 6)
        XCTAssertEqual(viewModel.books.first?.id, 100)
        XCTAssertEqual(viewModel.books.last?.id, 600)
    }
}

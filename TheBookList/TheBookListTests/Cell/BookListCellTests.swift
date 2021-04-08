//
//  BookListCellTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import XCTest
@testable import TheBookList

class BookListCellTests: XCTestCase {

    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testBook() throws {
        // Given
        var book: Book!
        let cell = BookListCell()
        
        // When
        book = Book(id: 8, title: "The Book List", isbn: "123321", bookDescription: "The Book List Description", price: 1000, currencyCode: "EUR", author: "Daniel")

        let lblTitle = UILabel()
        let lblPrice = UILabel()
        let lblAuthor = UILabel()
        
        cell.lblTitle = lblTitle
        cell.lblPrice = lblPrice
        cell.lblAuthor = lblAuthor
        
        cell.viewModel = BookListCellViewModel(model: book)
        
        // Then
        XCTAssertEqual(cell.lblTitle.text, "The Book List")
        XCTAssertEqual(cell.lblPrice.text, "€10.00")
        XCTAssertEqual(cell.lblAuthor.text, "by Daniel")
        
        // When
        cell.prepareForReuse()
        
        // Then
        XCTAssertEqual(cell.lblTitle.text, "")
        XCTAssertEqual(cell.lblPrice.text, "")
        XCTAssertEqual(cell.lblAuthor.text, "")
    }
    
}

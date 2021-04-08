//
//  AppCoordinatorTests.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 03/04/2021.
//

import XCTest
@testable import TheBookList

class AppCoordinatorTests: XCTestCase {
    
    override func tearDownWithError() throws {
        super.tearDown()
    }
    
    func testAppCoordinatorStart() throws {
        // Given
        let nav = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: nav)
        
        // When
        appCoordinator.start()
        
        // Then
        XCTAssertEqual(nav.viewControllers.first!.nibName, "BookListViewController")
    }
    
    func testAppCoordinatorPushDetails() throws {
        // Given
        let nav = UINavigationController()
        let appCoordinator = AppCoordinator(navigationController: nav)
        let book = Book(id: 8, title: "The Book List", isbn: "123321", bookDescription: "The Book List Description", price: 1234, currencyCode: "EUR", author: "Daniel")
        
        // When
        appCoordinator.ShowBookDetails(book)
        
        // Then
        XCTAssertEqual(nav.viewControllers.first!.nibName, "BookDetailsViewController")
    }
}


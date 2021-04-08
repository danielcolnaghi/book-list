//
//  BookListViewModel.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import Foundation
import Combine

class BookListViewModel {
    
    private let apiService: APIService
    
    @Published var books = [Book]()
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    func start() {
        fetchData()
    }
    
    private func fetchData() {
        self.getBookList { [weak self] (response: Result<[Book], Error>) in
            switch response {
            case let .success(bookList):
                self?.books = bookList
                break
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
    
    private func getBookList(result: @escaping (Result<[Book], Error>) -> ()) {
        apiService.request(router: .getBookList) { (response: Result<[Book], Error>) in
            switch response {
            case let .success(bookList):
                debugPrint("📕 list loaded")
                result(.success(bookList))
            case let .failure(error):
                debugPrint(error)
            }
        }
    }
}

//
//  BookDetailsViewModel.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import Foundation
import Combine

class BookDetailsViewModel: BookBaseViewModel {
    
    private let apiService: APIService
    @Published var error: Error!
    
    init(apiService: APIService, model: Book) {
        self.apiService = apiService
        super.init(model: model)
    }
    
    func start() {
        fetchData()
    }
    
    private func fetchData() {
        self.getBookDetails { [weak self] (response: Result<Book, Error>) in
            switch response {
            case let .success(book):
                self?.model = book
                break
            case let .failure(error):
                self?.error = error
            }
        }
    }
    
    func getBookDetails(result: @escaping (Result<Book, Error>) -> ()) {
        apiService.request(router: .getSingleBook(id: model.id)) { (response: Result<Book, Error>) in
            switch response {
            case let .success(book):
                debugPrint("📕 loaded")
                result(.success(book))
            case let .failure(error):
                result(.failure(error))
                debugPrint("🔴 \(error)")
            }
        }
    }
}


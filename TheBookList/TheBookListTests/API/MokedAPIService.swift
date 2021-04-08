//
//  MokedAPIService.swift
//  TheBookListTests
//
//  Created by Daniel Colnaghi on 03/04/2021.
//

import Foundation
@testable import TheBookList

class MockedAPIService: APIService {
    
    override func request<T>(router: APIRouter, result: @escaping (Result<T, Error>) -> ()) where T : Decodable {
        var model: T!
        switch router {
        case .getSingleBook(_):
            model = loadFileAsJson(fileName: "SingleBookGet")
            result(.success((model)))
        case .getBookList:
            model = loadFileAsJson(fileName: "BookListsGet")
            result(.success((model)))
        }
    }
    
    func loadFileAsJson<T: Decodable>(fileName: String) -> T? {
        guard let path = Bundle.main.path(forResource: fileName, ofType: "json"),
              let jsonData = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return nil}
        
        return try? JSONDecoder().decode(T.self, from: jsonData)
    }
}

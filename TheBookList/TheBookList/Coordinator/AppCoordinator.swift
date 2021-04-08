//
//  AppCoordinator.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import UIKit

final class AppCoordinator {
    private let navigationController: UINavigationController
    private let apiService: APIService
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.apiService = APIService()
    }
    
    func start() {
        let viewModel = BookListViewModel(apiService: apiService)
        let viewController = BookListViewController.loadFromNib()
        viewController.viewModel = viewModel
        viewController.appCoordinator = self
        navigationController.pushViewController(viewController, animated: false)
    }
    
    func ShowBookDetails(_ book: Book) {
        let viewModel = BookDetailsViewModel(apiService: apiService, model: book)
        let viewController = BookDetailsViewController.loadFromNib()
        viewController.viewModel = viewModel
        navigationController.pushViewController(viewController, animated: true)
    }
}

protocol AppCoordinatorDelegate {
    var appCoordinator: AppCoordinator? { get set }
}

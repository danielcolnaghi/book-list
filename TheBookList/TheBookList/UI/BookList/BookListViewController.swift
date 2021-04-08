//
//  BookListViewController.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import UIKit
import Combine

class BookListViewController: UIViewController, AppCoordinatorDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!

    var appCoordinator: AppCoordinator?
    var viewModel: BookListViewModel!
    private var binding = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard viewModel != nil else { return }
        
        setup()
    }
    
    private func setup() {
        let cellNib = UINib(nibName: BookListCell.identifier, bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: BookListCell.identifier)
        setupBinding()
        viewModel.start()
        self.title = Localize.text(.BookList)
    }
    
    private func setupBinding() {
        viewModel.$books.receive(on: DispatchQueue.main)
            .sink { (_) in
                if(self.viewModel.books.count > 0) {
                    self.tableView.reloadData()
                    self.tableView.isHidden = false
                    self.loading.stopAnimating()
                }
            }.store(in: &binding)
    }
}

extension BookListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.books.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookListCell.identifier, for: indexPath) as? BookListCell else {
            return UITableViewCell()
        }
        let modelAtRow = viewModel.books[indexPath.row]
        cell.viewModel = BookListCellViewModel(model: modelAtRow)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = self.viewModel.books[indexPath.row]

        appCoordinator?.ShowBookDetails(selectedBook)
    }
}

//
//  BookDetailsViewController.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import UIKit
import Combine

class BookDetailsViewController: UIViewController {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblIsbn: UILabel!
    @IBOutlet weak var lblDescription: UITextView!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var viewModel: BookDetailsViewModel!
    private var binding = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard viewModel != nil else { return }

        viewModel.start()
        setupBinding()
    }

    private func setup() {
        lblTitle.text = viewModel.title
        lblIsbn.text = viewModel.isbn
        lblDescription.text = viewModel.description
        lblPrice.text = viewModel.price
        lblAuthor.text = viewModel.author
    }
    
    private func setupBinding() {
        viewModel.$model.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [unowned self] value in
                if(value != nil) {
                    self.setup()
                    debugPrint("📕 details loaded")
                    if (self.viewModel.description != "") {
                        self.loading.stopAnimating()
                    }
                }
            }).store(in: &binding)

        viewModel.$error.receive(on: DispatchQueue.main)
            .sink(receiveValue: { [unowned self] error in
                if (error != nil) {
                    debugPrint("🔴 Error loading 📕 details")
                    self.loading.stopAnimating()
                    self.showAlertMessage(Localize.text(.ErrorMessage))
                }
            }).store(in: &binding)
    }
}

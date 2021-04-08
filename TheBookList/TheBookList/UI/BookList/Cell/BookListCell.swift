//
//  BookListCell.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 01/04/2021.
//

import UIKit

class BookListCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblAuthor: UILabel!
    
    var viewModel: BookListCellViewModel! {
        didSet {
            updateCellLayout()
        }
    }
    
    func updateCellLayout() {
        lblTitle.text = viewModel.title
        lblPrice.text = viewModel.price
        lblAuthor.text = viewModel.author
    }
    
    static var identifier : String {
        return String(describing: self)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        lblTitle.text = ""
        lblPrice.text = ""
        lblAuthor.text = ""
    }
}

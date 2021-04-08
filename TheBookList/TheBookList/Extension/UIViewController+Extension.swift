//
//  UIViewController+Extension.swift
//  TheBookList
//
//  Created by Daniel Colnaghi on 02/04/2021.
//

import UIKit

extension UIViewController {
    
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }
        return instantiateFromNib()
    }
    
    func showAlertMessage(_ message: String) {
        let alert = UIAlertController(title: Localize.text(.Alert), message: message, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: Localize.text(.OK), style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

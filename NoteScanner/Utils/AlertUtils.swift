//
//  File.swift
//  RV
//
//  Created by Roger Navarro on 11/2/17.
//  Copyright © 2017 Roger Navarro. All rights reserved.
//

import Foundation
import UIKit


class AlertUtils {
    static func showAlertWithOkButton(title: String?, message: String?, in viewController: UIViewController, handler: (()->(Void))? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:  { _ in
            guard let handler = handler else { return }
            handler()
        })
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
    
    static func showConfirmationMessage(title: String?, message: String?, in viewController: UIViewController, handler: (()->(Void))? = nil) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler:  { _ in
            guard let handler = handler else { return }
            handler()
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil)
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        viewController.present(alert, animated: true, completion: nil)
    }
        
        static func showAlertWithTextField(title: String?, message: String?, in viewController: UIViewController, completion handler: @escaping (_ value: String, _ success: Bool) -> (Void)) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addTextField(configurationHandler: {(_ textField: UITextField) -> Void in
            let password = NSLocalizedString("Password", comment: "Localized textField label for: Password")
            textField.placeholder = password
            textField.isSecureTextEntry = true
        })
        
        let confirmAction = UIAlertAction(title: "OK", style: .default, handler: { _ in
            handler(alertController.textFields![0].text!, true)
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler:{ _ in
            handler("", false)
        })
        
        alertController.addAction(confirmAction)
        alertController.addAction(cancelAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}

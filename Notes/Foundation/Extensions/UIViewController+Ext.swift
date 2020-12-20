//
//  UIViewController+Ext.swift
//  Notes
//
//  Created by Alican Aycil on 20.12.2020.
//

import UIKit

extension UIViewController {
    
    func presentAlertMessage(message: String){
        
        let alert = UIAlertController(title: message,
                                      message: nil,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true)
    }

}

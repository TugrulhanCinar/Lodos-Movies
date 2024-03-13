//
//  BaseViewController.swift
//  Lodos Movies
//
//  Created by Tuğrul on 13.03.2024.
//

import UIKit

class BaseViewController: UIViewController {
    
}


extension BaseViewController{
    
    public func showAlertMessage(title: String, message: String){
        
        let alertMessagePopUpBox = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default)
        
        alertMessagePopUpBox.addAction(okButton)
        self.present(alertMessagePopUpBox, animated: true)
    }
}

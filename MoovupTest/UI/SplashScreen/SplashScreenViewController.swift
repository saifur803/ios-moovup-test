//
//  SplashScreenViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 23/2/2024.
//

import Foundation
import UIKit


class SplashScreenViewController: UIViewController {
    
    private let rootView = SplashScreenView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ApiClient.shared.callPeopleListApi { (isSuccess, isDataAvailable) in
            if (isSuccess || isDataAvailable) {
                Navigator.shared.openMainTabScreen()
                return
            }
            
            self.showSimpleAlert(title: "Failed", message: "Failed load data\nTry again later.")
        }
    }
    
}

extension UIViewController {
    func showSimpleAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)

        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: { _ in
            alert.dismiss(animated: true)
        }))

        present(alert, animated: true, completion: nil)
    }
}

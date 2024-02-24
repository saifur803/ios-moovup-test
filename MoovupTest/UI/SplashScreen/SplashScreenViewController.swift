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
            
            
            
        }
    }
    
}

//
//  ListScreenViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit


class ListScreenViewController: UIViewController {
    
    private let rootView = ListScreenView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(AppDatabase.shared.getPeopleList().count)
    }
}

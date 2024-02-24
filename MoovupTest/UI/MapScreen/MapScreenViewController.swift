//
//  MapScreenViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit

class MapScreenViewController: UIViewController {
    private let rootView = MapScreenView()
    
    override func loadView() {
        super.loadView()
        view = rootView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}

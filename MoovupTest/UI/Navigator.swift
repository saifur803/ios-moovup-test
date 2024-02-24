//
//  Navigator.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 23/2/2024.
//

import Foundation
import UIKit


class Navigator {
    static let shared = Navigator()
    var window: UIWindow?
    
    func setWindow(window: UIWindow) {
        self.window = window
    }
    
    func openSplashScreen() {
        guard let window = window else { fatalError("Navigator: No Window") }
        let viewController = SplashScreenViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
    
    func openMainTabScreen() {
        guard let window = window else { fatalError("Navigator: No Window") }
        let viewController = MainTabViewController()
        let navigationController = UINavigationController(rootViewController: viewController)
        window.rootViewController = navigationController
    }
}

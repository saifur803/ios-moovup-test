//
//  MainTabViewController.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit


class MainTabViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewControllers = getChildViewControllers()
        
        tabBar.tintColor = .systemBlue
        tabBar.unselectedItemTintColor = .systemGray
        tabBar.barTintColor = .white
    }
    
    private func getChildViewControllers() -> [UIViewController] {
        
        let listScreen = ListScreenViewController()
        let listIcon = UIImage(systemName: "list.clipboard")
        listScreen.tabBarItem = UITabBarItem(title: "List View", image: listIcon, selectedImage: listIcon)
        
        let mapScreen = MapScreenViewController()
        let mapIcon = UIImage(systemName: "map")
        mapScreen.tabBarItem = UITabBarItem(title: "Map View", image: mapIcon, selectedImage: mapIcon)
        
        return [listScreen, mapScreen]
    }
}

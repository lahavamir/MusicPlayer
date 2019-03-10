//
//  AppCoordinator.swift
//
//  Created by Amir lahav on 31/01/2019.
//  Copyright © 2019 Amir lahav. All rights reserved.
//

import Foundation
import UIKit

class AppCoordinator:Coordinator
{
    var window:UIWindow
    var pressenter: UINavigationController
    var searchCoordinator:SearchCoordinator
    
    init(window:UIWindow) {
        
        self.window = window
        
        // setup container
        pressenter = UINavigationController()
        pressenter.navigationBar.prefersLargeTitles = false

        /// test contoller
        let test = UIViewController()
        test.view.backgroundColor = .brown
//        pressenter.pushViewController(test, animated: false)
        
        searchCoordinator = SearchCoordinator(pressenter: pressenter)
        
    }
    
    
    func start() {
        
        self.window.rootViewController = pressenter
        
        searchCoordinator.start()
        
        self.window.makeKeyAndVisible()
    }

}

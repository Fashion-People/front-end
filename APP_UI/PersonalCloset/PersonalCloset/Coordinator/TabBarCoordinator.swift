//
//  TabBarCoordinator.swift
//  PersonalCloset
//
//  Created by Bowon Han on 1/8/24.
//

import UIKit

class TabBarCoordinator : Coordinator {
    var childCoordinators: [Coordinator] = []
        
    private var navigationController : UINavigationController!
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let viewController = TabBarController()
        
        self.navigationController.viewControllers = [viewController]
    }
}


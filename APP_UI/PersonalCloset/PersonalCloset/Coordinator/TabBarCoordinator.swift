//
//  TabBarCoordinator.swift
//  PersonalCloset
//
//  Created by Bowon Han on 1/14/24.
//

import UIKit

final class TabBarCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        print("홈탭코디네이터시작")
        goToHomeTabbar()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func goToHomeTabbar() {
        let tabbarController = CustomTabBarController()
        
        let mainNavigationController = UINavigationController()
        let mainCoordinator = MainCoordinator(navigationController: mainNavigationController)
        
        mainCoordinator.parentCoordinator = parentCoordinator
        
        
        let settingNavigationController = UINavigationController()
        let settingCoordinator = SettingCoordinator(navigationController: settingNavigationController)
        
        settingCoordinator.parentCoordinator = parentCoordinator
        
        
        tabbarController.viewControllers = [mainNavigationController, settingNavigationController]
        navigationController.pushViewController(tabbarController, animated: true)
        navigationController.isNavigationBarHidden = true
        
        parentCoordinator?.childCoordinator.append(mainCoordinator)
        parentCoordinator?.childCoordinator.append(settingCoordinator)
        
        
        mainCoordinator.start()
        settingCoordinator.start()
    }

    deinit {
        print("홈탭코디네이터해제")
    }
}

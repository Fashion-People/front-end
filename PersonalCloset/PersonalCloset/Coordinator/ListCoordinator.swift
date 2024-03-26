//
//  ListCoordinator.swift
//  PersonalCloset
//
//  Created by Bowon Han on 1/17/24.
//

import UIKit

final class ListCoordinator : Coordinator {
    var parentCoordinator: Coordinator?
    var childCoordinator: [Coordinator] = []
    
    var navigationController: UINavigationController

    func start() {
        presentListVC()
    }
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        navigationController.isNavigationBarHidden = true
    }
}

extension ListCoordinator : ClothListViewControllerDelegate,
                          RegisterImageViewControllerDelegate {
    func backToPreviousVC() {
        navigationController.popToRootViewController(animated: true)
    }
    
    func presentResultVC() {
        
    }
    
    func presentListVC() {
        let listVC = ClothListViewController()
        listVC.delegate = self
        navigationController.pushViewController(listVC, animated: true)
    }
    
    func presentRegisterVC() {
        let registerVC = RegisterImageViewController()
        registerVC.delegate = self
        navigationController.pushViewController(registerVC, animated: true)
    }
}

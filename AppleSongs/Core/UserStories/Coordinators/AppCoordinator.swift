//
//  AppCoordinator.swift
//  AppleSongs
//
//  Created by Petryk Dima on 04.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit

class AppCoordinator {

    private weak var window: UIWindow?
    private var childCoordinators = [Coordinator]()

    init(_ window: UIWindow?) {
        self.window = window
    }

    private func changeWindowRootViewController(to viewController: UIViewController) {

        guard let window = self.window else { return }

        window.rootViewController = viewController

        UIView.transition(with: window,
                          duration: 0.5,
                          options: [.transitionCrossDissolve],
                          animations: nil,
                          completion: nil)

    }
    
    func startListScene() {

        childCoordinators.removeAll()

        let navigationController = UINavigationController()
        let listCoordinator = ListCoordinator.init(navigationController: navigationController)
        
        listCoordinator.parentCoordinator = self
        listCoordinator.start()

        childCoordinators.append(listCoordinator)

        changeWindowRootViewController(to: navigationController)
        
        window?.makeKeyAndVisible()
    }
}

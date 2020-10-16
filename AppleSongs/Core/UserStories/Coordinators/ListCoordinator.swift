//
//  ListCoordinator.swift
//  AppleSongs
//
//  Created by Petryk Dima on 04.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Foundation
import UIKit

class ListCoordinator: Coordinator {

    var parentCoordinator: AppCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {

        let viewController = ListTableViewController.instantiate()
        viewController.coordinator = self

        navigationController.pushViewController(viewController, animated: true)
    }
    
    func openDetailSong(song: Song) {

        let viewController = DetailSongViewController.instantiate()
        viewController.coordinator = self
        
        viewController.viewModel.song = song

        navigationController.pushViewController(viewController, animated: true)
    }
}

//
//  SceneDelegate.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    var coordinator: AppCoordinator?

    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo
        session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {

        if let windowScene = scene as? UIWindowScene {

            window = UIWindow(windowScene: windowScene)

            coordinator = AppCoordinator(window)
            coordinator?.startListScene()
        }
    }
}

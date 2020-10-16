//
//  Coordinator.swift
//  AppleSongs
//
//  Created by Petryk Dima on 04.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit

protocol Coordinator: class {

    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }

    func start()
}

protocol Xibbed {

    static func instantiate() -> Self
}

extension Xibbed where Self: UIViewController {

    static func instantiate() -> Self {

        let fullName = NSStringFromClass(self)

        let className = fullName.components(separatedBy: ".")[1]

        let nibName = className.replacingOccurrences(of: "Controller", with: "")

        let storyboard = UIStoryboard.init(name: nibName, bundle: nil)
        let controller = storyboard.instantiateViewController(identifier: className) as Self
        
        return controller
    }
}

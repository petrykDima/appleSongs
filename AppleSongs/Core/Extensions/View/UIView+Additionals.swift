//
//  UIView+Additionals.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import UIKit

extension UIView {
    static func uinib() -> UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}

//
//  Box.swift
//  MVVM-2
//
//  Created by Ivan Akulov on 15/05/2018.
//  Copyright © 2018 Ivan Akulov. All rights reserved.
//

import Foundation

class Box<T> {

    typealias Listener = (T) -> Void

    private var listener: Listener?

    var value: T {

        didSet {
            listener?(value)
        }
    }

    func bind(listener: @escaping Listener) {
        self.listener = listener
        listener(value)
    }

    init(_ value: T) {
        self.value = value
    }
}

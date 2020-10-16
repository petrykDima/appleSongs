//
//  ListViewModelType.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Foundation

protocol ListViewModelType {

    var songsArray: Box<[Song?]> { get set }

    func fetchSongs()

    func getSongs() -> [Song?]
    func getSong(for index: Int) -> Song?
}

protocol ListTableViewControllerProtocol: class {

    var coordinator: ListCoordinator? { get set}

    var viewModel: ListViewModelType { get set }
}

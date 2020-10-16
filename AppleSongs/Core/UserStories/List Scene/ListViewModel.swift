//
//  ListViewModel.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Foundation

class ListViewModel: ListViewModelType {

    var songsArray: Box<[Song?]> = Box([])

    func fetchSongs() {
        NetworkService.fetchSongs(
            responseSuccess: { [weak self] songs in

            self?.songsArray.value = songs
        },
            responseError: { error in
            print(error?.localizedDescription ?? "")
        })
    }

    func getSongs() -> [Song?] {

        return songsArray.value
    }

    func getSong(for index: Int) -> Song? {

        return songsArray.value[index]
    }

}

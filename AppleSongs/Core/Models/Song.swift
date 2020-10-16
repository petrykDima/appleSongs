//
//  Song.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Realm
import RealmSwift
import Foundation

class Song: Object, Decodable {

    @objc dynamic private(set) var songId: String = ""
    @objc dynamic private(set) var collectionName: String = ""
    @objc dynamic private(set) var artwork: String?

    override static func primaryKey() -> String? {
        return "songId"
    }

    private enum CodingKeys: String, CodingKey {

        case songId = "id"
        case collectionName
        case artwork = "artworkUrl100"
    }

    required init() {
        super.init()
    }

    required init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        self.songId = try container.decode(String.self, forKey: .songId)
        self.collectionName = try container.decode(String.self, forKey: .collectionName)
        self.artwork = try container.decode(String.self, forKey: .artwork)

        super.init()
    }

}

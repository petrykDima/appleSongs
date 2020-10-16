//
//  NetworkService.swift
//  AppleSongs
//
//  Created by Petryk Dima on 03.09.2020.
//  Copyright © 2020 Petryk. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {

    class private func convertData<T: Decodable>(dataDict: [String: Any], to expectedType: T.Type) -> T? {
        do {
            let data = try JSONSerialization.data(withJSONObject: dataDict, options: [])
            return try? JSONDecoder().decode(expectedType, from: data)
        } catch {
            print(error.localizedDescription)
        }
        return nil
    }
}

extension NetworkService {

    /// Method to fetch songs from network
    class public func fetchSongs(responseSuccess: @escaping([Song?]) -> Void,
                                 responseError: @escaping(Error?) -> Void) {

        let link = "https://rss.itunes.apple.com/api/v1/us/apple-music/top-songs/all/100/explicit.json"
        AF.request(link, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in

            switch response.result {
            case .success(let value):

                guard let responseDict = value as? [String: Any] else {
                    responseError(nil)
                    return
                }

                guard responseDict["success"] as? Bool == false else {
                    if let feedDict = responseDict["feed"] as? [String: Any] {

                        var songsArray: [Song?] = []

                        if let songsJsonArray = feedDict["results"] as? [[String:Any]] {

                            for songData in songsJsonArray {
                                let song = convertData(dataDict: songData, to: Song.self)
                                songsArray.append(song)
                            }

                            responseSuccess(songsArray)
                        }
                    }

                    return
                }

            case .failure(let error):
                responseError(error)
            }
        }
    }
}

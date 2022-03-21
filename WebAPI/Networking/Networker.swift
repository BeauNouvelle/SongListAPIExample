//
//  Networker.swift
//  WebAPI
//
//  Created by Beau Nouvelle on 22/3/2022.
//

import Foundation

class Networker {

    // https://openwhyd.org/hot/electro?format=json

    func loadSongs(completion: @escaping ((TrackList) -> Void)) {
        let url = URL(string: "https://openwhyd.org/hot/electro?format=json")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            do {
                let trackList = try JSONDecoder().decode(TrackList.self, from: data!)
                completion(trackList)
            } catch {
                print(error.localizedDescription)
            }
        }
        .resume()
    }

}

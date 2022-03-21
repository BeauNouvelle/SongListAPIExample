//
//  Song.swift
//  WebAPI
//
//  Created by Beau Nouvelle on 22/3/2022.
//

import Foundation

struct Song: Decodable {
    let name: String
    let img: URL
}

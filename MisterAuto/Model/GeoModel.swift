//
//  GeoModel.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
class Geo: Codable {
    var lat, lng: String?

    init(lat: String?, lng: String?) {
        self.lat = lat
        self.lng = lng
    }
    public enum CodingKeys: String, CodingKey {
       case lat, lng
    }
}

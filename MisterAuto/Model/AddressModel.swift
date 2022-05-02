//
//  CompanyModel.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
public struct Address: Codable {
    var street, suite, city, zipcode: String?
    var geo: Geo?

    init(street: String?, suite: String?, city: String?, zipcode: String?, geo: Geo?) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    public enum CodingKeys: String, CodingKey {
        case street, suite, city, zipcode
        case geo
    }
}

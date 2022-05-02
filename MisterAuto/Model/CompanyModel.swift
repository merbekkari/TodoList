//
//  CompanyModel.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

public struct Company: Codable {
    var name, catchPhrase, bs: String?

    init(name: String?, catchPhrase: String?, bs: String?) {
        self.name = name
        self.catchPhrase = catchPhrase
        self.bs = bs
    }
    public enum CodingKeys: String, CodingKey {
        case name, catchPhrase, bs
    }
    
}

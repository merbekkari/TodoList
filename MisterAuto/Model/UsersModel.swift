//
//  UserModel.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
import BaseJson4
public struct Users: Codable,BaseJson4 {
    public var id: Int?
    public var name, username, email: String?
    public var address: Address?
    public var phone, website: String?
    public var company: Company?

    init(id: Int?, name: String?, username: String?, email: String?, address: Address?, phone: String?, website: String?, company: Company?) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    public enum CodingKeys: String, CodingKey {
        case id
        case name,username,email,phone,website
        case address
        case company   
    }

}

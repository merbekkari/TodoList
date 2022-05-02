//
//  ListTachesUser.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
import BaseJson4

public struct listTachesUser: Codable,BaseJson4 {
    public var userID, id: Int?
    public var title: String?
    public var completed: Bool?

  
    init(userID: Int?, id: Int?, title: String?, completed: Bool?) {
        self.userID = userID
        self.id = id
        self.title = title
        self.completed = completed
    }
    enum CodingKeys: String, CodingKey {
        case userID
        case id, title, completed
    }

}

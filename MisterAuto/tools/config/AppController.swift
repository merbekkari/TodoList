//
//  AppController.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

enum AppController : String {
    case Main
    case ListUsers
    
    var name : String {
        return self.rawValue
    }
}

//
//  ApiEndpoints.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation


public enum ApiEndpoints : String {
    case LIST_USERS =  "/users/"
    case LIST_TACHES = "/todos?userId"
    
    
    var url : String {
        return "\(ApiConfig.BASE_URL)\(self.rawValue)"
    }
}

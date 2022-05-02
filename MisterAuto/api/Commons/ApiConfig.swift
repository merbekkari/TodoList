//
//  ApiConfig.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
struct ApiConfig {
    
    public static let BASE_URL = APP_VERSION.URL.value
    public enum APP_VERSION : String {
        
        case URL = "https://jsonplaceholder.typicode.com"
        
        var value : String {
            return self.rawValue
        }
        
    }
}

//
//  AppValidations.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation


struct ValidationResult
{
    let success: Bool
    let error : String?
}


enum VALIDATION_ERROR : LocalizedError {
    case ERROR_CONNECTION
    
    var errorDescription: String? {
        switch self {
        case .ERROR_CONNECTION : return AppString.error_no_connection.value
        }
    }
}


public struct AppValidations {
    
     static func connectionValidation() throws {
         guard Reachability.isConnectedToNetwork() else {throw VALIDATION_ERROR.ERROR_CONNECTION}
     }
    
   
}


//
//  UsersServices.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

public struct UsersServices {
    
    public func getListUsers(completion : @escaping (_ users: [Users]?, _ success : Bool,_ error :String?) -> Void){
        
        let httpUtility = HttpUtility()
        httpUtility.apiData(
            requestUrl: ApiEndpoints.LIST_USERS.url,
            methode: .GET,
            requestBody: nil,
            parameters: nil,
            resultType: [Users].self
        ) { response, success,error  in
            AppLog.console(TAG: "Response body", message: response?.toJson() ?? "NADA")
            completion(response, success,error)
        }
        
        
        
    }
    
}

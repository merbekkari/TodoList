//
//  ListTacheUsersServices.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
import BaseJson4

public struct ListTacheUsersServices {
    
    public func getListTAcheByUser(id : Int, completion : @escaping (_ result: [listTachesUser]?, _ success : Bool,_ error :String?) -> Void) {
        let httpUtility = HttpUtility()
        let params = ["id" : id]
        httpUtility.apiData(
            requestUrl: ApiEndpoints.LIST_TACHES.url,
            methode: .GET,
            requestBody: nil,
            parameters: params,
            resultType: [listTachesUser].self
        ) { response, success,error  in
            AppLog.console(TAG: "Response body", message: response?.toJson() ?? "NADA")
            completion(response, success,error)
        }
    }
    
    
}


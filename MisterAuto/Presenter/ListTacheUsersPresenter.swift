//
//  ListTacheUsers.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

class ListTacheUsersPresenter{
    
    
    public func getListTacheByIdUser(id:Int,completion : @escaping (_ users: [listTachesUser]?, _ success : Bool,_ error :String?) -> Void) {
        let listUser = AppCaches.getAllTachesUsers()
      
   
        if let listUser = listUser?[id], listUser.isEmpty == false {
            completion(listUser,true,nil)
        return
        }
        do{
            try AppValidations.connectionValidation()
        }catch{
            completion([],false,AppString.error_no_connection.value )
            return
        }

        ListTacheUsersServices().getListTAcheByUser(id: id) { result, success, error in
            if success, let result = result {
                AppCaches.setListTachesUser(id: id, listUsers: result)
                    completion(result,true,nil)

            }else{
                completion([],false,error ?? AppString.error_system.value)
            }
        }
     }
    
    
    
    
}

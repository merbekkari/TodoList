//
//  ListUsersPresenter.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

class ListUsersPresenter{
   public func getListUsers(completion : @escaping (_ users: [Users]?, _ success : Bool,_ error :String?) -> Void) {

       if let users = AppCaches.getListUsers() {
           completion(users,true,nil)
           return
       }

      
       do{
           try AppValidations.connectionValidation()
       }catch{
           completion([],false,  AppString.error_no_connection.value)
           return
       }

       
       UsersServices().getListUsers { users, success, error in
           
           if success, let result = users {
                  
               AppCaches.setListUsers(listUsers: result)
                   completion(result,true,nil)
           }else{
               completion([],false,error ?? AppString.error_system.value)
           }
       }
    }
    
    
}

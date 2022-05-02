//
//  AppCaches.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
public class AppCaches {
    
//    private static var listUsers = [Users]()
    private static var listTacheByUserId = [Int:[listTachesUser]]()
    
    
    
    
    public static func getListUsers() -> [Users]?{

        
         let decoder = JSONDecoder()

        if let listUsersModel = UserDefaults.standard.value(forKey: "listUsers") as? Data {
           
           if let listUsers = try? decoder.decode([Users].self, from: listUsersModel) {
               print("Decoded data: \(listUsers)")
               return listUsers
           }
       }
        return nil
    }
    
    public static func setListUsers(listUsers : [Users]) {

        do {
            let jsonEncoder = JSONEncoder()
            
            UserDefaults.standard.set(try jsonEncoder.encode(listUsers), forKey: "listUsers")
            
            UserDefaults.standard.synchronize()
        }
        catch {
            print(error.localizedDescription)
        }

    }
 
    
    public static func getAllTachesUsers()-> [Int:[listTachesUser]]?{
        
        let decoder = JSONDecoder()

       if let listUsersModel = UserDefaults.standard.value(forKey: "listTachesUser") as? Data {
          
           if let listUsers = try? decoder.decode([Int:[listTachesUser]].self, from: listUsersModel) {
       
              return listUsers
          }
      }
        return [:]
    }
    
    
    
    public static func setListTachesUser(id:Int,listUsers : [listTachesUser]) {
        
  
        
        self.listTacheByUserId[id] = listUsers
        
        print("list tach user info \(   self.listTacheByUserId)")
        
        do {
            let jsonEncoder = JSONEncoder()
            
            UserDefaults.standard.set(try jsonEncoder.encode(self.listTacheByUserId), forKey: "listTachesUser")
            UserDefaults.standard.synchronize()
        }
        catch {
            print(error.localizedDescription)
        }


    }
    
   
    
}

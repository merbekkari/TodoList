//
//  AppLog.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

public struct AppLog {
    
    
    public static func console(TAG : String, message : String?){
        guard AppConfig.SHOW_LOGS else {return}
        guard let message = message else {
            print("\(TAG) :::: NO DATA")
            return
        }
        print("\(TAG) :::: \(message)")
    }
    
    
}

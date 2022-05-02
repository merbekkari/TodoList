//
//  Array-Extension.swift
//  MisterAuto
//
//  Created by mbekkari on 2/5/2022.
//

import Foundation
extension Array where Element: Any {
    
    func isNotEmpty() -> Bool{
        return !self.isEmpty
    }
}

//
//  String-Extension.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation
import UIKit

public extension String {
    
    func trim() -> String{
        return self.trimmingCharacters(in: NSCharacterSet.whitespaces)
    }
}

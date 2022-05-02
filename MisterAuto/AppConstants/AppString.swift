//
//  AppString.swift
//  MisterAuto
//
//  Created by mbekkari on 1/5/2022.
//

import Foundation

enum AppString : String {
    case error_no_connection = "Merci de vérifier votre connexion internet"
    case error_system = "error de system"
    case no_data = "Aucune data trouvé"
    var value: String {
        return self.rawValue
    }
}


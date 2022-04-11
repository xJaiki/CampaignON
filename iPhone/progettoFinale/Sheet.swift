//
//  Sheet.swift
//  progettoFinale
//
//  Created by Alessandro Volpe on 10/02/21.
//

import Foundation
import SwiftUI

struct Sheet: Identifiable{
    var id = UUID()
    var avatar = UIImage()
     var name: String = ""
     var race: String = ""
    var Class: String = ""
    var hp: String = ""
    var ac: String = ""
    var sp: String = ""
    var In: String = ""
    var pp: String = ""
    var cr: String = ""
  
    
}
struct Sheet2: Codable{
    var name: String = ""
    var race: String = ""
    var Class: String = ""
    var image = Data()
    var slot = Int()
    var hp: String = ""
    var ac: String = ""
    var sp: String = ""
    var In: String = ""
    var pp: String = ""
    var cr: String = ""
}


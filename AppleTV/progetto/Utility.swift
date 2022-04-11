//
//  Utility.swift
//  progetto
//
//  Created by Alessandro Volpe on 09/02/21.
//

import Foundation
import UIKit

public func store(image: Data, forKey key: String){
//    if let pngRepr = image.jpegData(compressionQuality: 0.2){
        UserDefaults.standard.setValue(image,forKey: key)
//    }
}
var issheet = false

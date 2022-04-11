//
//  Utility.swift
//  progettoFinale
//
//  Created by Alessandro Volpe on 08/02/21.
//

import Foundation
import UIKit
import SwiftUI


public func store(image: UIImage, forKey key: String){
    if let pngRepr = image.pngData(){
        UserDefaults.standard.set(pngRepr,forKey: key)
    }
}
var galleryKey = false
enum DataType: UInt32 {
  case string = 1
  case image = 2
  case sheet = 3
  case d2 = 4
  case d4 = 5
  case d6 = 6
  case d8 = 7
  case d10 = 8
  case d12 = 9
  case d20 = 10
  case sound = 11
  case clear = 69
}

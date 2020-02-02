//
//  Utilities.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import Foundation
import SwiftUI

class Utilities: NSObject {

func createResortList(num: Int) -> [Resort] {
    
    var resorts = [Resort]()
    
    for r in 0...num {
        
        let facilities = ["Pool", "Steam Room", "Ski Heaters"]
        let newResort = Resort(id: String(r), name: "Name" + String(r), country: "Country" + String(r), description: "Description" + String(r), imageCredit: "imagecredit" + String(r), price: Int.random(in: 1...3), size: Int.random(in: 1...3), snowDepth: r, elevation: r, runs: r, facilities: facilities)
        
        resorts.append(newResort)
        
    }
    
    return resorts
  
}

}//class

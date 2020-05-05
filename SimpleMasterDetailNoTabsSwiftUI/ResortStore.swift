//
//  ResortStore.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 3/23/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI
import Combine

class ResortStore: ObservableObject, Identifiable {
    
    //@Published var resorts : [Resort] = []
    @Published var resorts : [Resort] = [Resort(id: UUID(), name: "Resort Placeholder", country: "USA", description: "Description Placeholder", imageCredit: "my image", price: 5, size: 5, snowDepth: 5, elevation: 5, runs: 5, facilities: ["facilities placeholder"])
    ]
    
    init() {
        getResorts(num: 12)
    }
    
    func getResorts(num: Int) {
        
        var localResorts = [Resort]()
        
        for r in 0...num {
            
            let facilities = ["Pool", "Steam Room", "Ski Heaters"]
            let newResort = Resort(id: UUID(), name: "Name" + String(r), country: "Country" + String(r), description: "Description" + String(r), imageCredit: "imagecredit" + String(r), price: Int.random(in: 1...3), size: Int.random(in: 1...3), snowDepth: r, elevation: r, runs: r, facilities: facilities)
            
            localResorts.append(newResort)
            
        }
        self.resorts = localResorts
    }
    
    
    func getJSONResorts() {
        //later
        
    }
    
}



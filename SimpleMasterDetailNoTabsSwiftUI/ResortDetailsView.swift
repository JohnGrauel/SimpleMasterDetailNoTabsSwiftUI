//
//  ResortDetailsView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct ResortDetailsView: View {
    
    let resort: Resort
    
    var size: String {
        switch resort.size {
        case 1:
            return "Small"
        case 2:
            return "Average"
        case 3:
            return "Large"
        default:
            return "Large"
        }
    }
    
    var price: String {
        String(repeating: "$", count: resort.price)
        //String(repeating: "$", count: 12)
    }
    
    var body: some View {
        VStack {
            Text("Size: \(size)")
            Text("Price: \(price)")
        }
    }
}

struct ResortDetailsView_Previews: PreviewProvider {
    
    static var example = Resort(id: UUID(), name: "Example Name", country: "Example Country", description: "Example Description", imageCredit: "Example Image Credit", price: 12, size: 999, snowDepth: 999, elevation: 999, runs: 999, facilities: ["Example Name"])
    static var previews: some View {
        ResortDetailsView(resort: example)
    }
}

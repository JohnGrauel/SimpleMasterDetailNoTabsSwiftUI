//
//  SkiDetailsView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct SkiDetailsView: View {
    
    let resort: Resort
    
    var body: some View {
        VStack {
            Text("Elevation: \(resort.elevation) m")
            Text("Snow: \(resort.snowDepth) cm")
        }
    }
}

struct SkiDetailsView_Previews: PreviewProvider {
        static var example = Resort(id: "999", name: "Example Name", country: "Example Country", description: "Example Description", imageCredit: "Example Image Credit", price: 12, size: 999, snowDepth: 999, elevation: 999, runs: 999, facilities: ["Example Name"])
    static var previews: some View {
        SkiDetailsView(resort: example )
    }
}

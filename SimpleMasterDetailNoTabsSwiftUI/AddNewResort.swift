//
//  AddNewResort.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/28/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct AddNewResort: View {
    
    @State private var resortName = ""
    
    var body: some View {
        VStack {
            Text("Add a Resort")
            TextField("Enter a name", text: $resortName)
        }
    }
}

struct AddNewResort_Previews: PreviewProvider {
    static var previews: some View {
        AddNewResort()
    }
}

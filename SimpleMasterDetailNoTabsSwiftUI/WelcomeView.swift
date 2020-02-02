//
//  WelcomeView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import Foundation
import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        
        VStack{
            Text("Welcome to the Split Controller in SwiftUI")
                .font(.largeTitle)
            Text("Please select a resort from the left-hand slide in menu")
                .foregroundColor(.secondary)
        }
  
    }
}

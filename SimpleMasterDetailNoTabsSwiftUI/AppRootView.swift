//
//  AppRootView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 3/23/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct AppRootView: View {

    var body: some View {
        NavigationView {
            ContentView()
            WelcomeView()
        }
    }
}

struct AppRootView_Previews: PreviewProvider {
    
    static var previews: some View {
        AppRootView()
    }
}

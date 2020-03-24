//
//  ContentView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var resortStore = ResortStore()
    
    var body: some View {
        
        //NavigationView {//remove this when using AppRootView - which you use to have
        //access to the WelcomeView in iPad 

            List {
                ForEach(resortStore.resorts) { resort in
                    NavigationLink(destination: ResortView(resort: resort)) {

                        HStack(spacing: 20) {
                            VStack(alignment: .leading) {
                                Text(resort.name).font(.system(.headline, design: .serif))
                                Text(resort.country).font(.system(.subheadline, design: .serif))
                                Text("Elevation: \(resort.elevation)").font(.system(.caption, design: .serif)).foregroundColor(.secondary)
                            }
                            Image(systemName: "gear")
                            .resizable()
                                .frame(width: 50, height: 50)
                        }
                    }
                }
                .onDelete { indexSet in
                    self.removeItems(at: [indexSet.first!])
                }
            }
        .navigationBarTitle("Resorts")
        .navigationBarItems(trailing: EditButton())
        //}
    }
     
    func removeItems(at offsets: IndexSet) {
        resortStore.resorts.remove(atOffsets: offsets)
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

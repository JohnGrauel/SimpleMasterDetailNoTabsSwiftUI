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
    @State private var addNewResort = false
    
    var body: some View {

        List {
            ForEach(resortStore.resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    
                    HStack(spacing: 20) {
                        Image("FlatheadLake1")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(RoundedRectangle(cornerRadius: 5)
                                .stroke(Color.black, lineWidth: 1))
                            .shadow(radius: 10, x: 10, y: 10)
                        VStack(alignment: .leading, spacing: 10) {
                            Text(resort.name).font(.system(.headline, design: .serif))
                            Text(resort.country).font(.system(.subheadline, design: .serif))
                            Text("Elevation: \(resort.elevation)").font(.system(.caption, design: .serif)).foregroundColor(.secondary)
                        }
                    }
                }
            }
            .onDelete { indexSet in
                self.removeItems(at: [indexSet.first!])
            }
        }
        .navigationBarTitle("Resorts")
        .navigationBarItems(leading:
            Button(action: {
                self.addNewResort.toggle()
            }) {
                Image(systemName: "hammer")
            }
            .sheet(isPresented: $addNewResort) {
                AddNewResort(resortStore: self.resortStore)
            }
            ,
            trailing: EditButton())

    }//body
     
    func removeItems(at offsets: IndexSet) {
        resortStore.resorts.remove(atOffsets: offsets)
    }

}//struct

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

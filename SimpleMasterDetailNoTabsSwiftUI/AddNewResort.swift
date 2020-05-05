//
//  AddNewResort.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/28/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct AddNewResort: View {
    
    @ObservedObject var resortStore: ResortStore
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    @Binding var selectedResortId: UUID?
    
    @State private var resortName = ""
    @State private var resortCountry = ""
    @State private var resortDescription = ""
    @State private var resortPriceString = ""
    @State private var resortSizeString = ""
    
    
    var body: some View {
        VStack {
            Text("Add a Resort")
            VStack {
                TextField("Enter a name", text: $resortName)
                TextField("Enter a country", text: $resortCountry)
                TextField("Enter a description", text: $resortDescription)
                TextField("Enter a price", text: $resortPriceString)
                TextField("Enter a size", text: $resortSizeString)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding(EdgeInsets(top: 20, leading: 30, bottom: 20, trailing: 30))
            
            Button(action: {

                let newResort = Resort(id: UUID(), name: self.resortName, country: self.resortCountry, description: self.resortDescription, imageCredit: "Credit", price: Int(self.resortPriceString) ?? 0, size: Int(self.resortSizeString) ?? 0, snowDepth: 20, elevation: 3000, runs: 40, facilities: ["bar", "garage"])

                self.resortStore.resorts.append(newResort)
                self.presentationMode.wrappedValue.dismiss()
                
                if self.horizontalSizeClass == .regular {
                    self.selectedResortId = newResort.id
                }
            }) {
                Text("Save Trip")
            }
            .padding(.trailing, 20)

        }
    }
}




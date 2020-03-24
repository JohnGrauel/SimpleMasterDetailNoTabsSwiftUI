//
//  ResortList.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct ResortList: View {
    
    
    @State private var showTimeSequence = false
    @State private var addNewResort = false

    var body: some View {
        
        let resorts = createResortList(num: 10)
        
        return List(resorts) { resort in
            NavigationLink(destination: ResortView(resort: resort)) {
                Image("HuckALaHuckMedium")
                .resizable()
                .scaledToFill()
                .frame(width: 40, height: 40)
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .overlay(RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.black, lineWidth:  1))
                VStack(alignment: .leading) {
                    Text(resort.name)
                        .font(.headline)
                    Text("\(resort.runs) runs")
                        .foregroundColor(.secondary)
                }
            }
        }
        .navigationBarTitle("Resorts")
        .navigationBarItems(leading:
            Button(action: {
                self.showTimeSequence.toggle()
            }) {
                Image(systemName: "hammer")
            }
            .sheet(isPresented: $addNewResort) {
                AddNewResort()
            }
            ,
            
            trailing:
            Button(action: {
                self.showTimeSequence.toggle()
            }) {
                Image(systemName: "camera")
                    .font(Font.system(.title))
            }
            )
            .sheet(isPresented: $showTimeSequence) {
                WelcomeView()
        }
    }
    
    //put this somewhere else
    func createResortList(num: Int) -> [Resort] {
        
        var resorts = [Resort]()
        
        for r in 0...num {
            
            let newResort = Resort(id: String(r), name: "Name" + String(r), country: "Country" + String(r), description: "Description" + String(r), imageCredit: "imagecredit" + String(r), price: Int.random(in: 1...3), size: Int.random(in: 1...3), snowDepth: r, elevation: r, runs: r, facilities: ["Facilities" + String(r)])
            
            resorts.append(newResort)
            
        }
        
        return resorts
      
    }

    
    
}

struct ResortList_Previews: PreviewProvider {
    static var previews: some View {
        ResortList()
    }
}

//
//  ContentView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct ContentView: View {
        var body: some View {
            
            let resorts = createResortList(num: 10)
            
            return List(resorts) { resort in
                NavigationLink(destination: ResortView(resort: resort)) {
                    Image("HuckALaHuckMedium")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 25)
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ResortView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

struct ResortView: View {
    
    let resort: Resort
    
    var body: some View {
        ScrollView {
            VStack(alignment: .center, spacing: 0) {
                Image("HuckALaHuckMedium")
                //Image(decorative: resort.id)
                    .resizable()
                    .frame(width: 200, height: 200)
                    .scaledToFit()
                
                Group {
                    Text(resort.description)
                        .padding(.vertical)
                    
                    HStack {
                        Spacer()
                        ResortDetailsView(resort: resort)
                        SkiDetailsView(resort: resort)
                        Spacer()
                    }
                    .font(.headline)
                    .foregroundColor(.secondary)
                    .padding(.top)

                    Text(ListFormatter.localizedString(byJoining: resort.facilities))
                        .padding(.vertical)
                        .font(.headline)
                    Text(resort.facilities.joined(separator: ", "))
                        .padding(.vertical)
                }
                .padding(.horizontal)
            }//vstack
        }//scrollview
            .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var example = Resort(id: "999", name: "Example Name", country: "Example Country", description: "Example Description", imageCredit: "Example Image Credit", price: 12, size: 999, snowDepth: 999, elevation: 999, runs: 999, facilities: ["Example Name"])
    static var previews: some View {
        ResortView(resort: example)
    }
}

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
        GeometryReader { geo in
            ScrollView {
                VStack(alignment: .center, spacing: 0) {
                    Image("HuckALaHuckMedium")
                        .resizable()
                        
                        .frame(width: (geo.size.width < geo.size.height) ? (geo.size.width - 35) : geo.size.height - 35,
                               height: (geo.size.width < geo.size.height) ? (geo.size.width - 35) : geo.size.height - 35, alignment: .center)

                        //.frame(width: geo.size.width - 35, height: geo.size.width - 35)
                        .scaledToFit()
                    
                    Group {
                        Text(self.resort.description)
                            .padding(.vertical)
                        
                        HStack {
                            Spacer()
                            ResortDetailsView(resort: self.resort)
                            SkiDetailsView(resort: self.resort)
                            Spacer()
                        }
                        .font(.headline)
                        .foregroundColor(.secondary)
                        .padding(.top)
                        
                        Text(ListFormatter.localizedString(byJoining: self.resort.facilities))
                            .padding(.vertical)
                            .font(.headline)
                        Text(self.resort.facilities.joined(separator: ", "))
                            .padding(.vertical)
                    }
                    .padding(.horizontal)
                }//vstack
            }//scrollview
        }//geo
            .navigationBarTitle(Text("\(resort.name), \(resort.country)"), displayMode: .inline)
    }
}

struct ResortView_Previews: PreviewProvider {
    static var example = Resort(id: UUID(), name: "Example Name", country: "Example Country", description: "Example Description", imageCredit: "Example Image Credit", price: 12, size: 999, snowDepth: 999, elevation: 999, runs: 999, facilities: ["Example Name"])
    static var previews: some View {
        ResortView(resort: example)
    }
}

//
//  ContentView.swift
//  SimpleMasterDetailNoTabsSwiftUI
//
//  Created by John Grauel on 2/1/20.
//  Copyright © 2020 John Grauel. All rights reserved.
//

import SwiftUI

/*
struct ContentView: View {
    
    @ObservedObject var resortStore = ResortStore()
    @State private var addingNewResort = false
    @State private var coverDeletedDetail = false
    @State var selectedResortId: UUID? = nil
    
    @Environment(\.presentationMode) var presentationMode

    
    var navigationLink: NavigationLink<EmptyView, ResortView>? {
        guard let selectedResortId = selectedResortId,
            let selectedResort = resortStore.resorts.first(where: {$0.id == selectedResortId}) else {
                return nil
        }

        return NavigationLink(
            destination: ResortView(resort: selectedResort),
            tag:  selectedResortId,
            selection: $selectedResortId
        ) {
            EmptyView()
        }
    }
    
    var body: some View {

        
            NavigationView {
                ZStack {
                    navigationLink
                    List {
                        ForEach(resortStore.resorts, id: \.self.id) { resort in
                            Button(action: {
                                self.selectedResortId = resort.id
                            }) {
                                Text(resort.name)
                            }
                            .listRowBackground(self.selectedResortId == resort.id ? Color.gray : Color(UIColor.systemBackground))
                        }

                    }
                }
                .navigationBarTitle("Resorts")
                .navigationBarItems(trailing: Button("Add Resort") {
                    self.addingNewResort = true
                })
                    .sheet(isPresented: $addingNewResort) {
                        AddNewResort(resortStore: self.resortStore, selectedResortId: self.$selectedResortId)
                            .environmentObject(self.resortStore)
                }

                WelcomeView()
            }

        
//        List {
//            ForEach(resortStore.resorts) { resort in
//                NavigationLink(destination: ResortView(resort: resort)) {
//                    HStack(spacing: 20) {
//                        Image("FlatheadLake1")
//                            .resizable()
//                            .scaledToFill()
//                            .frame(width: 50, height: 50)
//                            .clipShape(RoundedRectangle(cornerRadius: 5))
//                            .overlay(RoundedRectangle(cornerRadius: 5)
//                                .stroke(Color.black, lineWidth: 1))
//                            .shadow(radius: 10, x: 10, y: 10)
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text(resort.name).font(.system(.headline, design: .serif))
//                            Text(resort.country).font(.system(.subheadline, design: .serif))
//                            Text("Elevation: \(resort.elevation)").font(.system(.caption, design: .serif)).foregroundColor(.secondary)
//                        }
//                    }
//                }
//            }
//            .onDelete { indexSet in
//                self.removeItems(at: [indexSet.first!])
//                self.coverDeletedDetail.toggle()
//            }
//
//            if UIDevice.current.userInterfaceIdiom == .pad {
//                NavigationLink(destination: WelcomeView(), isActive: self.$coverDeletedDetail) {
//                    Text("")
//                }
//            }
//
//        }//list
//        .onAppear(perform: self.selectARow)
//        .navigationBarTitle("Resorts")
//        .navigationBarItems(leading:
//            Button(action: {
//                self.addNewResort.toggle()
//            }) {
//                Image(systemName: "hammer")
//            }
//            .sheet(isPresented: $addNewResort) {
//                AddNewResort(resortStore: self.resortStore, selectedResortId: self.$selectedID)
//            }
//            ,
//            trailing: EditButton()
//            )

    }//body
     
    func removeItems(at offsets: IndexSet) {
        resortStore.resorts.remove(atOffsets: offsets)
    }
    
    func selectARow() {
        print("selectedID is \(String(describing: self.selectedResortId))")
    }

}//struct
*/

struct ContentView: View {
    @ObservedObject var resortStore = ResortStore()
    @State private var addingNewResort = false

    @State var selectedResortId: UUID? = nil
    @State private var coverDeletedDetail = false
    
    var navigationLink: NavigationLink<EmptyView, ResortView>? {
        guard let selectedResortId = selectedResortId,
            let selectedResort = resortStore.resorts.first(where: {$0.id == selectedResortId}) else {
                return nil
        }

        return NavigationLink(
            destination: ResortView(resort: selectedResort),
            tag:  selectedResortId,
            selection: $selectedResortId
        ) {
            EmptyView()
        }
    }

    var body: some View {

        NavigationView {
            ZStack {
                navigationLink
                List {
                    ForEach(resortStore.resorts, id: \.self.id) { resort in
                        Button(action: {
                            self.selectedResortId = resort.id
                        }) {
                            Text(resort.name)
                        }
                        .listRowBackground(self.selectedResortId == resort.id ? Color.gray : Color(UIColor.systemBackground))
                    }
                    .onDelete { indexSet in
                        self.removeItems(at: [indexSet.first!])
                        
                        
                        DispatchQueue.main.async {
                            self.coverDeletedDetail.toggle()
                        }
                        //self.coverDeletedDetail.toggle()
                    }
 
                    
                    if UIDevice.current.userInterfaceIdiom == .pad {
                        NavigationLink(destination: WelcomeView(), isActive: self.$coverDeletedDetail) {
                            Text("")
                        }
                    }
                    
                    
                }
            }
            .navigationBarTitle("Resorts")
            .navigationBarItems(trailing: Button("Add Resort") {
                self.addingNewResort = true
            })
                .sheet(isPresented: $addingNewResort) {
                    AddNewResort(resortStore: self.resortStore, selectedResortId: self.$selectedResortId)
                        .environmentObject(self.resortStore)
            }

            WelcomeView()
        }

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

extension View {
    func phoneOnlyStackNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return AnyView(self.navigationViewStyle(StackNavigationViewStyle()))
        } else {
            return AnyView(self)
        }
    }
}

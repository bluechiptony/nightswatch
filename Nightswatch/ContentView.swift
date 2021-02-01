//
//  ContentView.swift
//  Nightswatch
//
//  Created by Anthony Egwu on 30/01/2021.
//  Copyright © 2021 Anthony Egwu. All rights reserved.
//

import SwiftUI

let nightlyTasks = [
    "Check all windows",
    "Check all doors",
    "Check that the safe is locked",
    "Check the mailbox",
    "Inspect security cameras",
    "Clear ice from sidewalk",
    "Document \"stange and unusual\" occurences"
]

let weeklyTasks = [
    "Check inside all vacant rooms",
    "Walk the perimeter of property"
]


let monthlyTasks = [
    "Test security alarm",
    "Test motion detectors",
    "Test smoke alarms"
]


struct NightsWatchContentView: View {
    
    
    var body: some View {
        NavigationView {
            List{
                Section(header:TaskSectionHeader(symbolSystemName: "moon.stars", headerName: "NIGHTLY TASKS")){
                   ForEach(nightlyTasks, id:\.self, content: {
                       tasName in
                        NavigationLink(tasName, destination: DetailsView(taskName: tasName))
                       
                   })
               }
               Section(header:TaskSectionHeader(symbolSystemName: "moon", headerName: "WEEKLY TASKS")){
                   ForEach(weeklyTasks, id:\.self, content: {
                       tasName in
                    NavigationLink(tasName, destination: DetailsView(taskName: tasName))
                   })
               }
               Section(header:TaskSectionHeader(symbolSystemName: "calendar", headerName: "MONTHLY TASKS")){
                   ForEach(monthlyTasks, id:\.self, content: {
                       
                       tasName in
                       NavigationLink(tasName, destination: DetailsView(taskName: tasName))
                   })
               }
               
                }.listStyle(GroupedListStyle()).navigationBarTitle("Home")
        }
    }
}

struct TaskSectionHeader: View {
    let symbolSystemName:String
    let headerName:String
    var body: some View {
        HStack{
            Image(systemName: symbolSystemName)
            Text(headerName)
        }.font(.subheadline)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NightsWatchContentView()
    }
}




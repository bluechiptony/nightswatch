//
//  ContentView.swift
//  Nightswatch
//
//  Created by Anthony Egwu on 30/01/2021.
//  Copyright © 2021 Anthony Egwu. All rights reserved.
//

import SwiftUI








struct NightsWatchContentView: View {
    
    @ObservedObject var nightsWatchTasks:NightsWatchTasks
    @State private var focusModeOn = false
    @State private var showResetAlert = false
    
    
    var body: some View {
        NavigationView {
            List{
                Section(header:TaskSectionHeader(symbolSystemName: "moon.stars", headerName: "NIGHTLY TASKS")){
                    
                    let taskIndices = nightsWatchTasks.nightlyTasks.indices;
                    let tasks = nightsWatchTasks.nightlyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs,  id:\.0.id,content: {
                       task, taskIndex in
                        let dollarNightswatchTasksWrapper = $nightsWatchTasks;
                        let tasksBindings = dollarNightswatchTasksWrapper.nightlyTasks
                        let theTaskBinding = tasksBindings[taskIndex]
                        if focusModeOn == false || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTaskBinding), label: {TaskRow(task: task)})
                        }

                    }).onDelete(perform: { indexSet in
                        nightsWatchTasks.nightlyTasks.remove(atOffsets:  indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightsWatchTasks.nightlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
               }
               Section(header:TaskSectionHeader(symbolSystemName: "moon", headerName: "WEEKLY TASKS")){
                    let taskIndices = nightsWatchTasks.weeklyTasks.indices;
                    let tasks = nightsWatchTasks.weeklyTasks
                    let taskIndexPairs = Array(zip(tasks, taskIndices))
                    
                    ForEach(taskIndexPairs,  id:\.0.id,content: {
                       task, taskIndex in
                        let dollarNightswatchTasksWrapper = $nightsWatchTasks;
                        let tasksBindings = dollarNightswatchTasksWrapper.weeklyTasks
                        let theTaskBinding = tasksBindings[taskIndex]
                        if focusModeOn == false || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTaskBinding), label: {TaskRow(task: task)})
                        }
                   }).onDelete(perform: { indexSet in
                        nightsWatchTasks.weeklyTasks.remove(atOffsets:  indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightsWatchTasks.weeklyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
               }
               Section(header:TaskSectionHeader(symbolSystemName: "calendar", headerName: "MONTHLY TASKS")){
                let taskIndices = nightsWatchTasks.monthlyTasks.indices;
                let tasks = nightsWatchTasks.monthlyTasks
                let taskIndexPairs = Array(zip(tasks, taskIndices))
                
                    ForEach(taskIndexPairs,  id:\.0.id,content: {
                       task, taskIndex in
                        let dollarNightswatchTasksWrapper = $nightsWatchTasks;
                        let tasksBindings = dollarNightswatchTasksWrapper.monthlyTasks
                        let theTaskBinding = tasksBindings[taskIndex]
                        if focusModeOn == false || (focusModeOn && !task.isComplete){
                            NavigationLink(destination: DetailsView(task: theTaskBinding), label: {TaskRow(task: task)})
                        }
                   }).onDelete(perform: { indexSet in
                        nightsWatchTasks.monthlyTasks.remove(atOffsets:  indexSet)
                    }).onMove(perform: { indices, newOffset in
                        nightsWatchTasks.monthlyTasks.move(fromOffsets: indices, toOffset: newOffset)
                    })
               }
            }.listStyle(GroupedListStyle()).navigationBarTitle("Home").toolbar(content: {
               
                ToolbarItem(placement:.navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement:.navigationBarTrailing){
                    Button("Reset"){
                        showResetAlert = true
                    }
                }
                
                ToolbarItem(placement: .bottomBar, content: {
                    Toggle(isOn:$focusModeOn, label:{
                        Text("Focus mode")
                    })
                })
            })
        }.alert(isPresented: $showResetAlert, content: {
            Alert(title: Text("Reset List"), message: Text("Are you sure you want to reset?"), primaryButton: .cancel(), secondaryButton: .destructive( Text("Yes please"), action: {
                let refreshedTasks = NightsWatchTasks()
                self.nightsWatchTasks.nightlyTasks = refreshedTasks.nightlyTasks
                self.nightsWatchTasks.weeklyTasks = refreshedTasks.weeklyTasks
                self.nightsWatchTasks.monthlyTasks = refreshedTasks.monthlyTasks
            }))
        })
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
    let nwt = NightsWatchTasks()
    static var previews: some View {
        NightsWatchContentView(nightsWatchTasks: NightsWatchTasks())
    }
}




struct TaskRow: View {
    let task:Task
    var body: some View {
        VStack {
            if task.isComplete {
                
                HStack {
                    Image(systemName: "checkmark.square")
                    Text(task.name).foregroundColor(.gray).strikethrough()
                }
                
            } else {
                HStack {
                    Image(systemName: "square")
                    Text(task.name)
                }
            }
        }
    }
}

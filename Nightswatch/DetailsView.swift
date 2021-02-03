//
//  DetailsView.swift
//  Nightswatch
//
//  Created by Anthony Egwu on 01/02/2021.
//  Copyright © 2021 Anthony Egwu. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    @Binding var task:Task
    var body: some View {
        VStack {
            Text(task.name)
            Text("Task detail description")
            Button("Mark Complete"){
                self.task.isComplete = true
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(task:Binding<Task>.constant(Task(name: "Teask", isComplete: false, lastCompleted: nil)))
    }
}

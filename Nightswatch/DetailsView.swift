//
//  DetailsView.swift
//  Nightswatch
//
//  Created by Anthony Egwu on 01/02/2021.
//  Copyright © 2021 Anthony Egwu. All rights reserved.
//

import SwiftUI

struct DetailsView: View {
    let taskName:String
    var body: some View {
        VStack {
            Text(taskName)
            Text("Task detail description")
            Text("Placeholder for makr task complete")
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(taskName:"Some task")
    }
}

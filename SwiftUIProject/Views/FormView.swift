//
//  FormView.swift
//  SwiftUIProject
//
//  Created by Nebo on 16.08.2022.
//

import SwiftUI

struct FormView: View {
    @State var pickerSection = 0
    var pickerContent = ["1", "2", "3"]
    
    var body: some View {
        NavigationView
        {
            Form {
                Picker(selection: $pickerSection) {
                    ForEach(0..<pickerContent.count) {
                        Text(pickerContent[$0])
                    }
                } label: {
                    Text("Label")
                }
                
                Text("Row 2")
                Text("Row 3")

            }.navigationBarTitle("Navigation Title")
        }

    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}

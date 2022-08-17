//
//  SegmentView.swift
//  SwiftUIProject
//
//  Created by Nebo on 17.08.2022.
//

import SwiftUI

struct SegmentView: View {
    @State var segmentIndex = 0
    @State var offsetX = 0.0
    private var segmentContent = ["One", "Two", "Three"]
    private var images = ["moon1", "moon2", "moon3"]
    
    
    var body: some View {
        VStack {
            Text("Moon - \(segmentContent[segmentIndex])")
            
            ZStack {
                Rectangle()
                    .fill(.mint)
                    .padding()
                    .frame(width: 350, height: 350)
                Image(images[segmentIndex])
                    .resizable()
                    .frame(width: 300, height: 300)
            }.offset(x: offsetX)
                .animation(.spring())
            
            Spacer()
            Picker(selection: Binding(get: {
                self.segmentIndex
            }, set: { newValue in
                self.segmentIndex = newValue
                move(offset: 500)
            }), label: Text("")) {
                ForEach(0..<segmentContent.count) {
                    Text(segmentContent[$0]).tag($0)
                }
            }.pickerStyle(SegmentedPickerStyle()).padding()
            Spacer().frame(height: 150)
        }
    }

    func move(offset: Double) {
        offsetX = offset
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.offsetX = 0
        }
    }
}

struct SegmentView_Previews: PreviewProvider {
    static var previews: some View {
        SegmentView()
    }
}

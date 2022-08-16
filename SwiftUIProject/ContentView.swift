//
//  ContentView.swift
//  SwiftUIProject
//
//  Created by Nebo on 16.08.2022.
//

import SwiftUI

struct ContentView: View {
    @State var isToggle = false
    
    var body: some View {
        VStack {
            ZStack {
                RoundedRectangle(cornerRadius: 10).fill(Color.blue)
                HStack{
                    Text("Надпись")
                        .font(.callout)
                        .fontWeight(.light)
                        .foregroundColor(Color.white)
                    Text("обычная")
                        .fontWeight(.medium)
                        .foregroundColor(Color.white)
                }
               
            }.offset(x: isToggle ? 1000 : 0)

            Toggle(isOn: $isToggle, label: { Text("Переключатель")}).padding()
        }.animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.7), value: isToggle)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

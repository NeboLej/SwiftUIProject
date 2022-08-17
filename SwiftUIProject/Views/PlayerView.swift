//
//  PlayerView.swift
//  SwiftUIProject
//
//  Created by Nebo on 17.08.2022.
//

import SwiftUI

struct PlayerView: View {
    @State private var sliderValue = 0.0
    @ObservedObject private var viewModel = PlayerViewModel()
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle().padding().foregroundColor(Color.pink).frame(width: 380, height: 380)
                Text("DED")
                    .font(.largeTitle)
                    .fontWeight(.light)
                    .foregroundColor(Color.white)   
            }
            Slider(value: Binding(get: {
                self.sliderValue
            }, set: { newValue in
                viewModel.setTime(time: newValue)
                self.sliderValue = newValue
            }), in: 0...viewModel.durationMusic, label: { Text("ff") }).padding()
            
            HStack {
                Button {
                    viewModel.play()
                    sliderValue = viewModel.player?.currentTime ?? 0.0
                } label: {
                    Text("Play")
                }.frame(width: 90, height: 50).foregroundColor(Color.white).background(Color.blue)
                
                Button {
                    viewModel.stop()
                } label: {
                    Text("Stop")
                }.frame(width: 90, height: 50).foregroundColor(Color.white).background(Color.blue)

            }
            
        }
    }
}

struct PlayerView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerView()
    }
}

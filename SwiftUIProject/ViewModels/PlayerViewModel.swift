//
//  PlayerViewModel.swift
//  SwiftUIProject
//
//  Created by Nebo on 17.08.2022.
//

import Foundation
import AVFoundation

class PlayerViewModel: ObservableObject {
    @Published var durationMusic = 0.0
    var player: AVAudioPlayer?
    
    func stop() {
        player?.stop()
    }
    
    func play() {
        playMusic(name: "ded")
        player?.play()
    }
    
    func setTime(time: Double) {
        guard let time = TimeInterval(exactly: Float(time)) else { return }
        player?.currentTime = time
        player?.play()
    }
    
    private func playMusic(name: String) {
        guard let audioPath = Bundle.main.path(forResource: name, ofType: "mp3") else { return }
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            durationMusic = player?.duration ?? 0.0
        } catch {
            print("error - \(error.localizedDescription)")
        }
    }

}

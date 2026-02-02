//
//  AmbientSoundManager.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import AVFoundation

class AmbientSoundManager {

    @MainActor static let shared = AmbientSoundManager()
    private var player: AVAudioPlayer?

    func play() {
        guard let url = Bundle.main.url(forResource: "ambient", withExtension: "mp3") else { return }
        player = try? AVAudioPlayer(contentsOf: url)
        player?.volume = 0.15
        player?.numberOfLoops = -1
        player?.play()
    }

    func stop() {
        player?.stop()
    }
}

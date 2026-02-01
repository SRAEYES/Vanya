//
//  SoundManager.swift
//  SwiftStudentChalleneg
//
//  Created by user66 on 01/02/26.
//

import AVFoundation

class SoundManager {

    @MainActor static let shared = SoundManager()
    private var player: AVAudioPlayer?

    func playFootsteps() {
        guard let url = Bundle.main.url(forResource: "footstep", withExtension: "mp3") else {
            return
        }

        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.volume = 0.35          // 🔈 soft
            player?.numberOfLoops = -1     // 🔁 loop
            player?.prepareToPlay()
            player?.play()
        } catch {
            print("Audio error")
        }
    }

    func stopFootsteps() {
        player?.stop()
        player = nil
    }
}

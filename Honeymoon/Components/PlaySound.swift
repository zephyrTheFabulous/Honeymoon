//
//  PlaySound.swift
//  Honeymoon
//
//  Created by Anthony on 9/11/24.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
  if let path = Bundle.main.path(forResource: sound, ofType: type) {
    do {
      audioPlayer = try AVAudioPlayer(contentsOf: URL(filePath: path))
      audioPlayer?.play()
    } catch {
      print("No audio file found")
    }
  }
}

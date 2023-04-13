//
//  VideoPlayer.swift
//  miniChallenge3
//
//  Created by Bruno Lafayette on 13/04/23.
//

import AVKit

class VideoPlayer: NSObject, ObservableObject {
    @Published var player = AVPlayer()

    override init() {
        super.init()
        guard let url = Bundle.main.url(forResource: "consulte_abertura", withExtension: "mp4") else {
            return
        }
        player = AVPlayer(url: url)
        player.play()
    }
}


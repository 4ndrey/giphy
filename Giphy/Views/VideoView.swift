//
//  VideoView.swift
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {

    private var player: AVPlayer?
    private var playerLayer: AVPlayerLayer?
    private var playingURL: URL?

    func playVideo(at videoURL: URL) {
        guard playingURL != videoURL else { return }

        playerLayer?.removeFromSuperlayer()
        NotificationCenter.default.removeObserver(self)

        player = AVPlayer(url: videoURL)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer?.frame = bounds
        layer.addSublayer(playerLayer!)
        player?.play()

        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: nil, using: { _ in
            DispatchQueue.main.async {
                self.player?.seek(to: CMTime.zero)
                self.player?.play()
            }
        })
    }

    override func layoutSubviews() {
        super.layoutSubviews()

        playerLayer?.frame = bounds
    }

    func pause() {
        player?.pause()
    }

    func play() {
        player?.play()
    }
}

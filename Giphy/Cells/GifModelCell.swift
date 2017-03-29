//
//  GifModelCell.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit
import AVFoundation

class GifModelCell: BaseCollectionCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var videoView: VideoView!

    override func updateWithItem(_ item: AnyObject) {
        if let item = item as? GifModel {
            if let videoURL = URL(string: item.videoUrl) {
                videoView.playVideo(at: videoURL)
            }
            titleLabel.text = item.slug
        }
    }
}

//
//  DetailsViewController.swift
//  Giphy
//
//  Created by Andrey Toropchin on 28.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import UIKit

class DetailsViewController: BaseViewController {

    @IBOutlet var videoView: VideoView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var shareButton: ShareButton!

    var presenter: DetailsPresenterInput!
    var router: DetailsRouterInput!

    override func configure() {
        DetailsConfigurator.configure(self)
    }

    @IBAction func share() {
        if let url = shareButton.url {
            router.share(url: url)
        }
    }
}

extension DetailsViewController: DetailsPresenterOutput {
    func showGifDetails(model: GifDetailsModel) {
        titleLabel.text = model.slug
        title = model.id

        if let videoUrl = URL(string: model.videoUrl) {
            videoView.playVideo(at: videoUrl)
        }
        if let shareUrl = URL(string: model.shareUrl) {
            shareButton.url = shareUrl
        }
    }
}

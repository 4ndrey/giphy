//
//  GifDetailsModelDataMapper.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class GifDetailsModelDataMapper {
    func transform(gif: Gif) throws -> GifDetailsModel {
        if let gif = gif as? GifDetailed {
            return GifDetailsModel(id: gif.id, videoUrl: gif.videoUrl, slug: gif.slug, shareUrl: gif.shareUrl)
        }
        else {
            throw "GifDetailed is expected"
        }
    }
}

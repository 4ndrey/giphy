//
//  GifModelDataMapper.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class GifModelDataMapper {
    func transform(gif: Gif) throws -> GifModel {
        if let gif = gif as? GifShort {
            return GifModel(id: gif.id, videoUrl: gif.videoUrl, slug: gif.slug)
        }
        throw "GifShort is expected"
    }
}

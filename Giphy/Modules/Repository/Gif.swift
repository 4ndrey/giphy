//
//  Gif.swift
//  Giphy
//
//  Created by Andrey Toropchin on 26.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

protocol Gif {
    var id: String { get }
}

struct GifShort: Gif {
    let id: String
    let videoUrl: String
    let slug: String
}

struct GifDetailed: Gif {
    let id: String
    let videoUrl: String
    let slug: String
    let shareUrl: String
}

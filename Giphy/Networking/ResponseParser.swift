//
//  ResponseParser.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class ResponseParser {

    func parse(_ response: NSDictionary) throws -> [Gif] {
        let badResponseError = "Bad response"
        var result = [Gif]()
        if let data = response["data"] as? NSArray {
            for item in data {
                guard let item = item as? NSDictionary else { throw badResponseError }
                guard let id = item["id"] as? String else { throw badResponseError }
                guard let slug = item["slug"] as? String else { throw badResponseError }
                guard let images = item["images"] as? NSDictionary else { throw badResponseError }
                guard let dict = images["fixed_height"] as? NSDictionary else { throw badResponseError }
                guard let url = dict["mp4"] as? String else { throw badResponseError }
                result.append(GifShort(id: id, videoUrl: url, slug: slug))
            }
        }
        else {
            guard let item = response["data"] as? NSDictionary else { throw badResponseError }
            guard let id = item["id"] as? String else { throw badResponseError }
            guard let slug = item["slug"] as? String else { throw badResponseError }
            guard let shareUrl = item["bitly_url"] as? String else { throw badResponseError }
            guard let images = item["images"] as? NSDictionary else { throw badResponseError }
            guard let dict = images["original"] as? NSDictionary else { throw badResponseError }
            guard let url = dict["mp4"] as? String else { throw badResponseError }
            result.append(GifDetailed(id: id, videoUrl: url, slug: slug, shareUrl: shareUrl))
        }
        return result
    }
}

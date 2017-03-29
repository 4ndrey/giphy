//
//  Networking.swift
//  Giphy
//
//  Created by Andrey Toropchin on 27.03.17.
//  Copyright © 2017 vice3.agency. All rights reserved.
//

import Foundation

class Networking {

    private static let baseUrl = "http://api.giphy.com"
    private static let apiKey = "dc6zaTOxFJmzC"

    private class func urlComponents() throws -> URLComponents {
        guard let baseURL = URL(string: baseUrl) else { throw "Bad base url" }
        guard let URLComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true) else { throw "Bad base url" }
        return URLComponents
    }

    class func getGifs(limit: Int = 20, offset: Int = 0) throws -> NSDictionary {
        var URLComponents = try urlComponents()
        URLComponents.path = "/v1/gifs/trending"

        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "limit", value: limit.description))
        queryItems.append(URLQueryItem(name: "offset", value: offset.description))
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        URLComponents.queryItems = queryItems

        guard let url = URLComponents.url else { throw "Failed to build URL" }
        print(url.absoluteString)

        let data = try Data(contentsOf: url)
        let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let response = result as? NSDictionary else { throw "Bad response" }
        return response
    }

    class func searchGifs(query: String? = nil, limit: Int = 20, offset: Int = 0) throws -> NSDictionary {
        var URLComponents = try urlComponents()
        URLComponents.path = "/v1/gifs/search"

        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "q", value: query))
        queryItems.append(URLQueryItem(name: "limit", value: limit.description))
        queryItems.append(URLQueryItem(name: "offset", value: offset.description))
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        URLComponents.queryItems = queryItems

        guard let url = URLComponents.url else { throw "Failed to build URL" }
        print(url.absoluteString)

        let data = try Data(contentsOf: url)
        let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let response = result as? NSDictionary else { throw "Bad response" }
        return response
    }

    class func getGif(id: String) throws -> NSDictionary {
        var URLComponents = try urlComponents()
        URLComponents.path = "/v1/gifs/\(id)"

        var queryItems = [URLQueryItem]()
        queryItems.append(URLQueryItem(name: "api_key", value: apiKey))
        URLComponents.queryItems = queryItems

        guard let url = URLComponents.url else { throw "Failed to build URL" }
        print(url.absoluteString)

        let data = try Data(contentsOf: url)
        let result = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        guard let response = result as? NSDictionary else { throw "Bad response" }
        return response
    }
}

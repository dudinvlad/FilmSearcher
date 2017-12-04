//
//  RequestHelper.swift
//  FilmSearcherTest
//
//  Created by Vlad on 01.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class RequestHelper: NSObject {
    
    class func getUrl(_ url:String, with page:Int, query:String?) -> URL {
        
        var urlComponents = URLComponents(string:url)
        urlComponents?.queryItems = [
            URLQueryItem.init(name: "api_key", value: ApiKey),
            URLQueryItem(name:"language", value: "ru"),
            URLQueryItem(name: "page", value: "\(page)"),
            URLQueryItem(name: "query", value: query)
        ]
        if query == nil {
            urlComponents?.queryItems?.remove(at: 3)
        }
        if page == 0 {
            urlComponents?.queryItems?.remove(at: 2)
        }
        return urlComponents?.url ?? URL(string:"")!
    }
    
     class func requestHeader() -> [String:String] {
        var headers = [String:String]()
        headers.updateValue("application/json", forKey: "Content-Type")
        headers.updateValue(ApiKey, forKey: "api_key")
        headers.updateValue("application/json", forKey: "Accept")
        return headers
    }
    
}

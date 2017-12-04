
//
//  ApiManager.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import Alamofire

private let timeoutInterval: TimeInterval = 30

public typealias responseBlock = (DataResponse<Any>?, String?) -> Void

class ApiManager {
    
    static let sharedApiManager = ApiManager()

    private  var alamofireManager: SessionManager = {
       let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = timeoutInterval
        configuration.timeoutIntervalForResource = timeoutInterval
        return Alamofire.SessionManager(configuration:configuration)
    }()

    func get(methodName: String, page: Int?, query: String?, params: [String:Any], completion: @escaping responseBlock) -> DataRequest {
        let url = RequestHelper.getUrl((ApiHost + methodName).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!, with: page ?? 0, query: query)
        return alamofireManager.request(url, method: .get, parameters: params, encoding: URLEncoding.default).responseJSON(completionHandler: { (response) in
            print(response.result.value ?? "")
            if response.result.isSuccess {
                completion(response, nil)
            }
            if response.result.isFailure {
                completion(nil, response.result.error?.localizedDescription)
            }
        })
    }
}


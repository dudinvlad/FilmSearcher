//
//  ResponseHelper.swift
//  FilmSearcherTest
//
//  Created by Vlad on 02.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class ResponseHelper : NSObject {
    
    class func getDataArray(_ withResponse:DataResponse<Any>?) -> [[String: Any]]? {
        var swiftyJSON = JSON(withResponse?.result.value! as Any)
        return swiftyJSON["results"].arrayObject as? [[String:Any]]
    }
    
    class func getDataWith(_ response: DataResponse<Any>) -> [String:Any]? {
        var swiftyJSON = JSON(response.result.value!)
        return swiftyJSON.dictionaryObject
    }
    
}

//
//  BaseModel.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: Mappable {
    
    public var modelID = 0
    
    public required init?(map: Map) {
    }
    init(modelID: Int) {
        self.modelID = modelID
    }
    
    public func mapping(map: Map) {
        self.modelID <- map["id"]
    }
}
extension BaseModel {
        
      
}

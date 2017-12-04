//
//  MovieModel.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import ObjectMapper

class MovieModel: BaseModel {
    
    var title: String?
    var originalTitle: String?
    var posterPath: String?
    var overview: String?
    var releaseDate: String?
    var videoPath: String?
    
    public required init?(map: Map) {
        super.init(map: map)
    }
    
    public override func mapping(map: Map) {
        super.mapping(map: map)
        self.title          <- map["title"]
        self.originalTitle  <- map["original_title"]
        self.posterPath     <- map["poster_path"]
        self.overview       <- map["overview"]
        self.releaseDate    <- map["release_date"]
    }
}

//
//  Constants.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

let ApiHost = "https://api.themoviedb.org/3/"
let ApiKey = "474533b8b0099185af8e45e577b3486e"
let ImagePath = "https://image.tmdb.org/t/p"
let youTubePath = "https://www.youtube.com/watch?v="

struct StoryboardConstants {
   static let mainStoryboard = "Main"
}

public typealias arrayBlock = ([Any]?, String?) -> Void
public typealias objectBlock = (Any?, String?) -> Void

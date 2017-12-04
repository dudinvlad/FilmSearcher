//
//  MovieService.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class MovieService {
    
    //MARK: - Singleton -
    
    static let shared: MovieService = {
        return MovieService()
    }()
    
    // MARK: - Class methods -
    
     func getUpcomingMoviesWith(_ page: Int, completion: @escaping arrayBlock) {
        let params = [String: Any]()
        _ = ApiManager.sharedApiManager.get(methodName: "movie/upcoming", page: page, query: nil, params: params, completion: { (response:DataResponse<Any>?, error: String?) in
            if let error = error {
                completion(nil, error)
            }
            guard let dataArray = ResponseHelper.getDataArray(response) else {completion(nil, ""); return}
            guard let films = Mapper<MovieModel>().mapArray(JSONArray: dataArray) as [MovieModel]? else {completion(nil, ""); return}
            completion(films, error)
        })
    }
    
     func getTrailerWith(_ modelID: Int, completion: @escaping objectBlock) {
        _ = ApiManager.sharedApiManager.get(methodName: "movie/\(modelID)/videos", page: 0, query: nil, params: [:], completion: { (response: DataResponse<Any>?, error: String?) in
            if let error = error {
                completion (nil, error)
                return
            }
            guard let objects = ResponseHelper.getDataArray(response) else { completion(nil, "Couldn't parse the object"); return}
            completion(objects.first?["key"], error)
        })
    }
    
    func searchFilmsWith(_ query: String, _ page: Int, completion: @escaping arrayBlock) {
        _ = ApiManager.sharedApiManager.get(methodName: "search/movie", page: page, query: query, params: [:], completion: { (response:DataResponse<Any>?, error: String?) in
            if let error = error {
                completion(nil, error)
                return
            }
            guard let dataArray = ResponseHelper.getDataArray(response) else {completion(nil, ""); return}
            guard let films = Mapper<MovieModel>().mapArray(JSONArray: dataArray) as [MovieModel]? else {completion(nil, ""); return}
            completion(films, error)
        })
    }
        
}

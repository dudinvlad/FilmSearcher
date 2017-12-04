//
//  Router.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class Router: NSObject {
    
    private let navigationController : UINavigationController?
    
    //MARK: - Initialization -
    
    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }
    
    //MARK: - Public -
    
    func showDetailMovieScreenWith(_ movie: MovieModel) {
        let detailMovieScreenViewController = viewControllerFromStoryboard(StoryboardConstants.mainStoryboard, type: DetailMovieViewController.self)
        detailMovieScreenViewController.movie = movie
        navigationController?.pushViewController(detailMovieScreenViewController, animated: true)
    }
    
    //MARK: - Private -
    
    func viewControllerFromStoryboard<T>(_ name: String, type: T.Type) -> T {
        let storyboard = UIStoryboard.init(name: name, bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: String.init(describing: T.self)) as? T
        assert(viewController != nil, "Can't get \(String.init(describing: T.self)) from storyboard \(name)")
        return viewController!
    }
}

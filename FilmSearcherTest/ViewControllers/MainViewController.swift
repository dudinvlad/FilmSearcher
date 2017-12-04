//
//  ViewController.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class MainViewController: BaseViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    var dataSource = [MovieModel]()
    var indexOfPage = 1
    var loadingStatus = false
    var queryString = ""
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }

    //MARK: - UITableViewDataSource -
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing:MyTableViewCell.self), for: indexPath) as! MyTableViewCell
        let movie = dataSource[indexPath.row]
        cell.loadCellWith(movie)
        cell.selectionStyle = .none
        return cell
    }
    
    //MARK: - UITableViewDelegate -
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let movie = dataSource[indexPath.row]
        showLoading()
        MovieService.shared.getTrailerWith(movie.modelID) {[weak self] (object: Any?, error:String?) in
            guard let weakSelf = self else {return}
            weakSelf.hideLoading()
            let trailerPath = object as? String
            movie.videoPath = trailerPath
            weakSelf.router.showDetailMovieScreenWith(movie)
        }
    }
    
     func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offSetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        if offSetY > contentHeight - scrollView.frame.size.height {
            if !loadingStatus {
                indexOfPage += 1
                if queryString.isEmpty {
                    getUpcomingMovies()
                } else {
                    searchFilms()
                }
            }
        }
    }
    
    //MARK: - UISearchBarDelegate -
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        view.endEditing(true)
        if (searchBar.text?.isEmpty)! {return}
        dataSource.removeAll()
        indexOfPage = 1
        searchFilms()
        queryString = searchBar.text!
    }
    
    public func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        queryString = searchText
        if queryString.isEmpty {
            view.endEditing(true)
            dataSource.removeAll()
            indexOfPage = 1
            getUpcomingMovies()
        }
    }
    
    //MARK: - Private -
    
    private func initialSetup() {
        getUpcomingMovies()
    }
    
    func getUpcomingMovies() {
        if !loadingStatus {
            loadingStatus = true
            showLoading()
            MovieService.shared.getUpcomingMoviesWith(indexOfPage) { [weak self] (objects: [Any]?, error:String?) in
                guard let weakSelf = self else { return }
                weakSelf.hideLoading()
                if let error = error {
                    weakSelf.alertWith(error)
                    weakSelf.loadingStatus = false
                }
                if let movies = objects as? [MovieModel] {
                    weakSelf.dataSource.append(contentsOf: movies)
                    weakSelf.tableView.reloadData()
                    weakSelf.loadingStatus = false
                }
            }
        }
    }
    
    func searchFilms() {
        if !loadingStatus {
            loadingStatus = true
            showLoading()
            MovieService.shared.searchFilmsWith(searchBar.text!, indexOfPage) {[weak self] (objects: Any?, error: String?) in
                guard let weakSelf = self else {return}
                weakSelf.hideLoading()
                if let error = error {
                    weakSelf.alertWith(error)
                }
                if let films = objects as? [MovieModel] {
                    weakSelf.dataSource.append(contentsOf: films)
                    weakSelf.tableView.reloadData()
                    weakSelf.loadingStatus = false
                }
            }
        }
    }

}


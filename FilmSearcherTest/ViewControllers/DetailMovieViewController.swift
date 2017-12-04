//
//  DetailMovieViewController.swift
//  FilmSearcherTest
//
//  Created by Vlad on 30.11.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import SDWebImage
import youtube_ios_player_helper

let bottomScrollViewContentOffset = CGFloat(20)

class DetailMovieViewController: BaseViewController {
    
    var movie : MovieModel!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var videoView: YTPlayerView!
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var viewContentConstraint: NSLayoutConstraint!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
        NotificationCenter.default.addObserver(self, selector: #selector(scrollViewContentSize), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollViewContentSize()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    //MARK: - Actions -
    
    @IBAction func backAction(_ sender: UIBarButtonItem) {
        goBack()
    }
    @IBAction func playAction(_ sender: UIButton) {
        playVideo()
    }
    
    //MARK: - Private -
    
    func initialSetup() {
        updateNavigationBar()
        fillingFields()
    }
    
    func updateNavigationBar() {
        title = movie.originalTitle
        customizeBackButton()
    }
    
    func fillingFields() {
        titleLabel.text = movie.title
        overviewLabel.text = movie.overview
        let attributedString = NSMutableAttributedString(string: "Release date: " + movie.releaseDate!)
        attributedString.addAttribute(NSAttributedStringKey.foregroundColor, value: UIColor.darkGray, range: NSRange(location: 13, length: 11))
        releaseDateLabel.attributedText = attributedString
        if let posterPath = movie.posterPath {
            movieImageView.sd_setImage(with: URL(string: ImagePath + "/w500" + posterPath), placeholderImage: #imageLiteral(resourceName: "movie_placeholder"))
        }
    }
    
    func playVideo() {
        guard let trailerPath = movie.videoPath else {return}
        videoView.load(withVideoId: trailerPath)
    }
    
    @objc func scrollViewContentSize() {
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width, height: videoView.frameBottom() + 20)
        viewContentConstraint.constant = videoView.frameBottom() + 20
        contentView.layoutIfNeeded()
    }
}

//
//  MyTableViewCell.swift
//  FilmSearcherTest
//
//  Created by Vlad on 01.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class MyTableViewCell : UITableViewCell {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Public -
    
    func loadCellWith(_ movie: MovieModel) {
        titleLabel.text = movie.title
        guard let posterPath = movie.posterPath else {return}
        posterImageView.sd_setImage(with:URL(string: ImagePath + "/w500" + posterPath) , placeholderImage: #imageLiteral(resourceName: "movie_placeholder"))
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        posterImageView.image = #imageLiteral(resourceName: "movie_placeholder")
    }
}

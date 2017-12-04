//
//  MyTableViewCell.swift
//  FilmSearcherTest
//
//  Created by Vlad on 01.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

class MyTableViewCell : UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    //MARK: - Public -
    
    func loadCellWith(_ movie: MovieModel) {
        titleLabel.text = movie.title
    }
}

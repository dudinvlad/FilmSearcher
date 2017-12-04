//
//  UIView.swift
//  FilmSearcherTest
//
//  Created by Vlad on 03.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit

extension UIView {
    
    // MARK: - Position -
    
    func frameBottom() -> CGFloat {
      return self.frame.origin.y + self.frame.size.height
    }
}

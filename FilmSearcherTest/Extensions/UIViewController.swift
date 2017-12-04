//
//  String.swift
//  FilmSearcherTest
//
//  Created by Vlad on 01.12.17.
//  Copyright © 2017 Vlad Dudin. All rights reserved.
//

import UIKit
import SVProgressHUD

extension UIViewController {
    
    //MARK: - AlertController
    
    public func alertWith(_ message:String) {
        let alertController = UIAlertController.init(title: "", message: message, preferredStyle: .alert)
        let OkAction = UIAlertAction.init(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(OkAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - NavigationBar -
    
    func addNavigationBarItemWith(_ image: UIImage, isLeft: Bool, target: AnyObject, selector: Selector) {
        let barButtonItem = UIBarButtonItem(image: image.withRenderingMode(.alwaysOriginal), style: .done, target: target, action: selector)
        if isLeft {
            self.navigationItem.leftBarButtonItem = barButtonItem
        } else {
            self.navigationItem.rightBarButtonItem = barButtonItem
        }
    }
    
    // MARK: - ProgressHud
    
    func showLoading() {
        SVProgressHUD.setBackgroundColor(UIColor.black)
        SVProgressHUD.setForegroundColor(UIColor.white)
        SVProgressHUD.setDefaultMaskType(SVProgressHUDMaskType.gradient)
        SVProgressHUD.setRingThickness(5.0)
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func showSuccesWithStatus(_ status:String) {
        SVProgressHUD.showSuccess(withStatus: status)
        
    }
}

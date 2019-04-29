//
//  NavigationController.swift
//  ChatAppPractice
//
//  Created by 松岡裕介 on 2019/04/19.
//  Copyright © 2019 松岡裕介. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return viewControllers.last?.preferredStatusBarStyle ?? .lightContent
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationBar.isTranslucent = false
        navigationBar.tintColor = .white
        navigationBar.barTintColor = .green
        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        if #available(iOS 11.0, *) {
            navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        }
        navigationBar.shadowImage = UIImage()
        navigationBar.setBackgroundImage(UIImage(), for: .default)
        view.backgroundColor = .green
        
        // Do any additional setup after loading the view.
    }
    
    func setAppearanceStyle(to style: UIStatusBarStyle) {
        if style == .default {
            navigationBar.shadowImage = UIImage()
            navigationBar.barTintColor = .green
            navigationBar.tintColor = .white
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
            if #available(iOS 11.0, *) {
                navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            }
        } else if style == .lightContent {
            navigationBar.shadowImage = nil
            navigationBar.barTintColor = .white
            navigationBar.tintColor = UIColor(red: 0, green: 0.5, blue: 1, alpha: 1)
            navigationBar.titleTextAttributes = [.foregroundColor: UIColor.black]
            if #available(iOS 11.0, *) {
                navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.black]
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

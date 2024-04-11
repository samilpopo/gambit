//
//  FirtsPage.swift
//  gambit
//
//  Created by samil on 18.12.2023.
//

import UIKit
import Alamofire

class FirstPage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.setBackIndicatorImage(UIImage(named: "icBackImage"), transitionMaskImage: UIImage(named: "icBackImage"))
        
        appearance.backgroundColor = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.backgroundColor = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        navigationController?.navigationBar.barTintColor = UIColor(red: 24/255, green: 24/255, blue: 24/255, alpha: 1)
        
    }
    
}

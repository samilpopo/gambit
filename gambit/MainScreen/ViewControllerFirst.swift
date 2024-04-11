//
//  ViewControllerFirst.swift
//  gambit
//
//  Created by samil on 13.09.2023.
//

import UIKit

class ViewControllerFirst: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
      
        let appearance = UINavigationBarAppearance()
       appearance.configureWithOpaqueBackground()
       appearance.backgroundColor = UIColor(displayP3Red: 21/255, green: 21/155, blue: 21/255, alpha: 1)
       
        
    }

}

//
//  ViewController.swift
//  gambit
//
//  Created by samil on 04.08.2023.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        let logoImage = UIImage(named: "gambitTitle")
        let imageViev = UIImageView(image: logoImage)
        navigationItem.titleView = imageViev 
        
         let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(displayP3Red: 227/255, green: 18/155, blue: 143/255, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
         
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

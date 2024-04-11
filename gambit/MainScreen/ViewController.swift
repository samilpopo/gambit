//
//  ViewController.swift
//  gambit
//
//  Created by samil on 04.12.2023.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tableView: UITableView!
    
    let url = "https://peretz-group.ru/api/v2/products?category=103&key=47be9031474183ea92958d5e255d888e47bdad44afd5d7b7201d0eb572be5278"
    
    var foods: [FoodModel] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        AF.request(url).responseDecodable(of: [FoodModel].self) { (respone) in
            
            if let model = respone.value {
                self.foods = model
                self.tableView.reloadData()
            } else {
                print("Oшибка в запросе")
            }
            
        }
        
        tableView.dataSource = self
      
        
    
        
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

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "FoodCell", for: indexPath) as? FoodCell else {return UITableViewCell()}
        cell.configure(foodmodel: foods[indexPath.row], delegate: self)
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let index = indexPath.row
        let isFav = Basket.shared.isFavorite(item: self.foods[index])
        
        let action = UIContextualAction(style: .normal, title: "") { action, view, completion in
            
            let item = self.foods[index]
            Basket.shared.addOrRemoveFavorite(item:  item)
            completion(true)
        }
        
        if isFav == true {
            action.image = UIImage(named: "heartIsActive")
        } else {
            action.image = UIImage(named: "heartIsFalse")
        }
        
        action.backgroundColor = UIColor(red: 8/255, green: 8/255, blue: 8/255, alpha: 0.04)
        
        let actions = UISwipeActionsConfiguration(actions: [action])
        
        return actions
    }
}
 



extension ViewController: FoodDelegate {
    
    func reload() {
        tableView.reloadData()
    }
}


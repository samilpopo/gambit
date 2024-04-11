//
//  FoodCell.swift
//  gambit
//
//  Created by samil on 04.12.2023.
//

import UIKit
import SDWebImage

protocol FoodDelegate {
    func reload()
}

class FoodCell: UITableViewCell {


    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var containerForPlusAndMinus: UIView!
    @IBOutlet weak var countInCartLabel: UILabel!
    @IBOutlet weak var productDescription: UITextView!
    @IBOutlet weak var addToCart: UIButton!
    
    var delegate: FoodDelegate?
    var foodModel: FoodModel?
    
    func configure(foodmodel: FoodModel, delegate: FoodDelegate) {
        self.delegate = delegate
        self.foodModel = foodmodel
        
        productImageView.sd_setImage(with: URL(string: foodmodel.image))
        productNameLabel.text = foodmodel.name
        productPriceLabel.text = "\(foodmodel.price) ₽"
        productDescription.text = foodmodel.description
        
        if Basket.shared.isAddedToCart(item:
            foodmodel) {
            let countInCart = Basket.shared.checkCount(item: foodmodel)
            if countInCart > 0 {
                countInCartLabel.text = "\(countInCart)"
                addToCart.isHidden = true
                containerForPlusAndMinus.isHidden = false
            } else {
                addToCart.isHidden = false
                containerForPlusAndMinus.isHidden = true
            }
        } else {
            addToCart.isHidden = false
            containerForPlusAndMinus.isHidden = true
        }
    }
    
    
    @IBAction func firstAddingInCart(_ sender: Any) {
        
        if let foodModel = foodModel {
            Basket.shared.addToCart(item: foodModel)
        }
        
        delegate?.reload()

    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if let foodModel = foodModel {
            Basket.shared.removeFromCart(item: foodModel)
        }
        
        delegate?.reload()
    }
    
    
    
    @IBAction func plusButtonDidTap(_ sender: Any) {
        if let foodModel = foodModel {
            Basket.shared.addToCart(item: foodModel)
    }
        delegate?.reload()
    }
    
} 


//
//  ViewController.swift
//  BeChef
//
//  Created by Agus Riady on 02/11/20.
//

import UIKit

class ViewController: UIViewController, IngredientsDelegate {

    var selectedIngredients = [String]()
    
    @IBOutlet weak var ingredientsLabel: UILabel!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var imgBack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        view.backgroundColor = .systemBackground
        if #available(iOS 13.0, *) {
                // Always adopt a light interface style.
                overrideUserInterfaceStyle = .light
            }
        
        switch traitCollection.userInterfaceStyle {
        case .dark:
            imgBack.image = UIImage (named: "BgScreenDark")
        case .light:
            imgBack.image = UIImage (named: "BgScreen")
        default:
            print("Default")
        }
        
        searchButton.isEnabled = false
        searchButton.backgroundColor = .gray
        searchButton.layer.cornerRadius = 10.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGoToIngredients" {
            if let nc = segue.destination as? UINavigationController {
                if let vc = nc.viewControllers[0] as? IngredientsTableViewController {
                    // Step 4
                    vc.delegate = self
                }
               
            }
        }
        else if segue.identifier == "segueGoTo" {
            var vc1 = segue.destination as! ReceiptVC
            vc1.finalbahan = ingredientsLabel.text!
        }
    }
    
   
    // Step 6
    // conform to IngredientsDelegate
    func finishSelectIngredients(selectedIngredients: [String]) {
        ingredientsLabel.text = selectedIngredients.joined(separator: " ")
    
        self.selectedIngredients = selectedIngredients
        if self.selectedIngredients.count > 0 {
        // Enable button
            searchButton.isEnabled = true
            searchButton.backgroundColor = .orange
            //performSegue(withIdentifier: "segueGoTo", sender: self)
            
        } else {
            searchButton.isEnabled = false
            searchButton.backgroundColor = .gray
        }
    }
}


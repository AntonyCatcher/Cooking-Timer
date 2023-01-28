//
//  ViewController.swift
//  Cooking Timer
//
//  Created by Anton  on 28.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    let eggTimes = ["Soft"   : 5,
                    "Medium" : 7,
                    "Hard"   : 12]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        let hardness = sender.titleLabel?.text
        
        switch hardness {
        case "Soft":
            print(eggTimes.values)
        case "Medium":
            print(eggTimes.values)
        case "Hard":
            print(eggTimes.values)
        default:
            print("Error")
        }
        
    }
    
}


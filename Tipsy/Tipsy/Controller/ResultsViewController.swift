//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Maria Luiza Carvalho Sperotto on 24/01/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var totalBill = ""
    var numberOfPeople = 0
    var tipPercentage = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalLabel.text = totalBill
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipPercentage)% tip"
        

       
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        
    }
    

}

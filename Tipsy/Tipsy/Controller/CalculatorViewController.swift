//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroButton: UIButton!
    @IBOutlet weak var tenButton: UIButton!
    @IBOutlet weak var twentyButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.0
    var people = 2
    var totalBill = 0.0
    var splittedBill = ""

   
    @IBAction func tipChanged(_ sender: UIButton) {
        zeroButton.isSelected = false
        tenButton.isSelected = false
        twentyButton.isSelected = false
        
        sender.isSelected = true
        guard let buttonTitle = sender.currentTitle else { return }
        let buttonTitleFormatted = String(buttonTitle.dropLast())
        let selectedPorcentage = Double(buttonTitleFormatted)!
        tip = selectedPorcentage / 100

        
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let value = sender.value
        splitNumberLabel.text = String(format: "%.0f", value)
        people = Int(value)
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        guard let bill = billTextField.text else { return }
        if bill != "" {
            totalBill = Double(bill)!
            let result = totalBill * (1 + tip) / Double(people)
            let resultFormatted = String(format: "%.2f", result)
            splittedBill = resultFormatted
        }
        
        performSegue(withIdentifier: "results", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "results" {
            let resultsVC = segue.destination as! ResultsViewController
            resultsVC.totalBill = splittedBill
            resultsVC.numberOfPeople = people
            resultsVC.tipPercentage = Int(tip * 100)
        }
    }
}


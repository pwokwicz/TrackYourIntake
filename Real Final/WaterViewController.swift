//
//  WaterViewController.swift
//  Real Final
//
//  Created by Parker Wokwicz on 12/13/18.
//  Copyright © 2018 Parker Wokwicz. All rights reserved.
//

import UIKit

class WaterViewController: UIViewController {
    
    @IBOutlet weak var returnHome: UIButton!
    @IBOutlet weak var cupsTextField: UITextField!
    
    var cupsArrayW: [Int] = []
    var totalCups = Int()
    var averageCupsW = Int()
    var calArrayW: [Int] = []
    var averageCalW = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func submit(_ sender: UIButton) {
        if let number = Int(cupsTextField.text!)  {
            cupsArrayW.append(number)
            for value in cupsArrayW {
                totalCups += value
            }
            averageCupsW = totalCups/cupsArrayW.count
        }
    }
    
    //New comments for Dev
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "waterReturnSegue" {
            if let dvc = segue.destination as? ViewController {
                dvc.cupsArrayV = self.cupsArrayW
                dvc.averageCupsV = self.averageCupsW
                dvc.averageCalV = self.averageCalW
                dvc.calArrayV = self.calArrayW
            }
        }
    }
 }

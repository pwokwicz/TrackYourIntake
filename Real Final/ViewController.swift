//
//  ViewController.swift
//  Real Final
//
//  Created by Parker Wokwicz on 12/13/18.
//  Copyright © 2018 Parker Wokwicz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var cupsArrayV: [Int] = []
    var averageCupsV = Int()
    var calArrayV: [Int] = []
    var averageCalV = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsSegue" {
            if let dsc = segue.destination as? StatsViewController {
                dsc.cupsArray = self.cupsArrayV
                dsc.averageCups = self.averageCupsV
                dsc.calArray = self.calArrayV
                dsc.averageCal = self.averageCalV
            }
        }
        if segue.identifier == "waterSegue" {
            if let dws = segue.destination as? WaterViewController {
                dws.averageCupsW = self.averageCupsV
                dws.cupsArrayW = self.cupsArrayV
                dws.calArrayW = self.calArrayV
                dws.averageCalW = self.averageCalV
            }
        }
        if segue.identifier == "foodSegue" {
            if let dfw = segue.destination as? FoodViewController {
                dfw.averageCalF = self.averageCalV
                dfw.calArrayF = self.calArrayV
                dfw.cupsArrayF = self.cupsArrayV
                dfw.averageCupsF = self.averageCupsV
            }
        }
    }
}


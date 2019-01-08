//
//  FoodViewController.swift
//  Real Final
//
//  Created by Parker Wokwicz on 12/13/18.
//  Copyright © 2018 Parker Wokwicz. All rights reserved.
//

import UIKit

class FoodViewController: UIViewController {

    @IBOutlet weak var returnHome: UIButton!
    @IBOutlet weak var calTextField: UITextField!

    
    var calArrayF: [Int] = []
    var totalCal = 0
    var averageCalF = Int()
    var averageCupsF = Int()
    var cupsArrayF: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func submit(_ sender: UIButton) {
        if let number = Int(calTextField.text!) {
            calArrayF.append(number)
            for value in calArrayF {
                totalCal += value
            }
            averageCalF = totalCal/calArrayF.count
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "foodReturnSegue" {
            if let dvc = segue.destination as? ViewController {
                dvc.averageCalV = self.averageCalF
                dvc.calArrayV = self.calArrayF
                dvc.averageCupsV = self.averageCupsF
                dvc.cupsArrayV = self.cupsArrayF
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

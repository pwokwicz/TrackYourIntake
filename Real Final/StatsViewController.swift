//
//  StatsViewController.swift
//  Real Final
//
//  Created by Parker Wokwicz on 12/13/18.
//  Copyright © 2018 Parker Wokwicz. All rights reserved.
//

import UIKit


class StatsViewController: UIViewController {

    @IBOutlet weak var returnHome: UIButton!
    @IBOutlet weak var statsView: UITextView!
    
    var cupsArray: [Int] = []
    var calArray: [Int] = []
    var averageCups = Int()
    var averageCal = Int()
    var extraGlass = Int()
    var extraCal = Int()
    
    func statsFunction() {
        extraGlass = 8 - averageCups
        if extraGlass < 0 {
            extraGlass = extraGlass / -1
        }
        extraCal = 2000 - averageCal
        if extraCal < 0 {
            extraCal = extraCal / -1
        }
        else if averageCups + averageCal == 0 {
            statsView.text = "You haven't logged anything yet. If you would like to see your stats start a log by clicking 'Return Home'"
        }
        else if averageCups > 0 && averageCal == 0 {
            if averageCups >= 6 && averageCups <= 10 {
                statsView.text = "Congrats, you're averaging \(averageCups) eight ounce cups of water a day! According to the MND, the perfect amount you should be drinking is 8 glasses a day, so you are only \(extraGlass) glasses away! But hmmmm, I don't see any data for your food intake. If you would like to start one click on the 'Return Home' button then go to 'Eat Something Lately?'"
            }
            if averageCups > 10 {
                statsView.text = "Woah woah slow down there cowboy. You're averaging \(averageCups) eight ounce cups of water a day. Your body can only handle up to 33 ounces of water an hour so if you drank that in 3 hours you'd be dead! According to the MND, the perfect amount you should be drinking is 8 glasses a day, so you are a good \(extraGlass) glasses ahead. But hmmmm, I don't see any data for your food intake. If you would like to start one click on the 'Return Home' button then go to 'Eat Something Lately?'"
            }
            if averageCups < 6 {
                statsView.text = "Are you living in a desert? Drink up! You're averaging \(averageCups) eight ounce cups of water a day! Lack of water can lead to nausea, headaches, kidney stones, or even death! According to the MND, the perfect amount you should be drinking is 8 glasses a day. But you are missing the mark my friend, you are behind by a whole \(extraGlass) glasses. But hmmmm, I don't see any data for your food intake. If you would like to start one click on the 'Return Home' button then go to 'Eat Something Lately?'"
            }
        }
        else if averageCups == 0 && averageCal > 0 {
            if averageCal >= 1750 && averageCal <= 2250 {
                statsView.text = "You rain supreme when watching your calorie intake. You average \(averageCal) calories per day which is nearly perfect as you are only \(extraCal) calories away from 2000! But hmmmm, I don't see any data for your water intake. If you would like to start one click on the 'Return Home' button then go to 'Update Your Water Consumption'"
            }
            if averageCal < 1750 {
                statsView.text = "You are too far under when it comes to eating. You have been averaging \(averageCal) calories per day. If you don't eat you won't be fat, but you are risking numerous health issues including halucinations, starvation, and anorexia. You need to step it up as you are \(extraCal) calories under the perfect 2000. But hmmmm, I don't see any data for your water intake. If you would like to start one click on the 'Return Home' button then go to 'Update Your Water Consumption'."
            }
            if averageCal > 2250 {
                statsView.text = "I know you are using this app and I'm supposed to like you, but slow down fatso! You're averaging \(averageCal) calories every day. Or should I be saying every cheat day because you're consuming \(extraCal) extra calories than you're supposed to. But hmmmm, I don't see any data for your water intake. If you would like to start one click on the 'Return Home' button then go to 'Update Your Water Consumption'."
            }
        }
        if averageCups > 0 && averageCal > 0 {
            if averageCups < 6 {
                statsView.text = "Are you living in a desert? Drink up! You're averaging \(averageCups) eight ounce cups of water a day! Lack of water can lead to nausea, headaches, kidney stones, or even death! According to the MND, the perfect amount you should be drinking is 8 glasses a day. But you are missing the mark my friend, you are behind by a whole \(extraGlass) glasses."
            }
            if averageCups >= 6 && averageCups <= 10 {
                statsView.text = "Congrats, you're averaging \(averageCups) eight ounce cups of water a day! According to the MND, the perfect amount you should be drinking is 8 glasses a day, so you are only \(extraGlass) glasses away!"
            }
            if averageCups > 10 {
                statsView.text = "Woah woah slow down there cowboy. You're averaging \(averageCups) eight ounce cups of water a day. Your body can only handle up to 33 ounces of water an hour so if you drank that in 3 hours you'd be dead! According to the MND, the perfect amount you should be drinking is 8 glasses a day, so you are a good \(extraGlass) glasses ahead."
            }
            if averageCal >= 1750 && averageCal <= 2250 {
                statsView.text += " You rain supreme when watching your calorie intake. You average \(averageCal) calories per day which is nearly perfect as you are only \(extraCal) calories away from 2000!"
            }
            if averageCal < 1750 {
                statsView.text += " You are too far under when it comes to eating though. You have been averaging \(averageCal) calories per day. If you don't eat you won't be fat, but you are risking numerous health issues including halucinations, starvation, and anorexia. You need to step it up as you are \(extraCal) calories under the perfect 2000"
            }
            if averageCal > 2250 {
                statsView.text += " I know you are using this app and I'm supposed to like you, but slow down fatso! You're averaging \(averageCal) calories every day. Or should I be saying every cheat day because you're consuming \(extraCal) extra calories than you're supposed to."
            }
        }
        else {
            statsView.text = "Have you been logging negative numbers or strings?! You're not using it right!"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        statsFunction()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "statsReturnSegue" {
            if let dvc = segue.destination as? ViewController {
                dvc.averageCalV = self.averageCal
                dvc.averageCupsV = self.averageCups
                dvc.cupsArrayV = self.cupsArray
                dvc.calArrayV = self.calArray
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    
    */

}

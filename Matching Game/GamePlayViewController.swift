//
//  GamePlayViewController.swift
//  Matching Game
//
//  Created by alcoderithm on 7/12/18.
//  Copyright © 2018 alcoderithm. All rights reserved.
//

import UIKit

class GamePlayViewController: UIViewController {
    
    @IBOutlet weak var fruitsWord: UILabel!
    @IBOutlet weak var scores: UILabel!
    @IBOutlet weak var highScores: UILabel!
    @IBOutlet weak var id: UILabel!
    var fruitsName = ["Apple", "Banana", "Grapes", "Pineapple", "Orange", "Strawberry"]
    var shuffledFruitsName = [String]()
    var fruitsNumber = 0
    var tappedCounter = 0                       //counter for the tapped buttons
    var yourScore = 0
    var highScore1 = 0
    var highScore2 = 0
    var highScore3 = 0
    var idNumber = 0                            //ID number of the player
    var highScore1ID = 0
    var highScore2ID = 0
    var highScore3ID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        shuffledFruitsName = shuffle(stringArray: fruitsName)
        fruitsWord.text = shuffledFruitsName[fruitsNumber]
        id.text = "ID#: ID\(idNumber + 1)"
        highScores.text = "High Score: \(highScore1)"
        scores.text = "Score: \(yourScore)"
    }
    
    @IBAction func appleTapped(_ sender: Any) {
        let fruitName = "Apple"
        tappedCounter += 1
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    @IBAction func bananaTapped(_ sender: Any) {
        let fruitName = "Banana"
        tappedCounter += 1
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    @IBAction func grapesTapped(_ sender: Any) {
        let fruitName = "Grapes"
        tappedCounter += 1
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    @IBAction func orangeTapped(_ sender: Any) {
        let fruitName = "Orange"
        tappedCounter += 1
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    @IBAction func pineappleTapped(_ sender: Any) {
        let fruitName = "Pineapple"
        tappedCounter += 1
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    @IBAction func strawberryTapped(_ sender: Any) {
        let fruitName = "Strawberry"
        tappedCounter += 1
        
        compareFruitName(fruitNameTapped: fruitName)
        compareTappedCounter(tapCounter:tappedCounter)
    }
    
    //compare the word displayed in the screen with respect to the tapped buttton
    func compareFruitName(fruitNameTapped:String){
        if fruitNameTapped == shuffledFruitsName[fruitsNumber] {
            yourScore += 1
            scores.text = "Score: \(yourScore)"
        }
    }
    
    //compare the number of tapped buttons with respect to the number of shuffled words
    func compareTappedCounter(tapCounter:Int){
        if tapCounter == fruitsName.count {
            performSegue(withIdentifier: "GameOver", sender: self)
        } else {
            fruitsNumber += 1
            fruitsWord.text = shuffledFruitsName[fruitsNumber]
        }
    }
    
    
    func shuffle(stringArray:[String]) -> [String] {
        //create a copy of the input array
        var items = stringArray
        
        //our new shuffled array
        var shuffled = [String]();
        
        //iterate through the item array
        for _ in items.enumerated()
        {
            //choose a random number
            let rand = Int(arc4random_uniform(UInt32(items.count)))
            //using that random number, select a random item
            let randomItem = items[rand]
            //append that random item to our new shuffled array
            shuffled.append(randomItem)
            //make sure to remove that item, so we don't pick it again
            items.remove(at: rand)
        }
        return shuffled
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let secondViewController = segue.destination as? GameOverViewController {
            idNumber += 1
            secondViewController.yourFinalScore = yourScore
            secondViewController.yourID = idNumber
            if yourScore >= highScore1 {
                secondViewController.top1Score = yourScore
                secondViewController.top2Score = highScore1
                secondViewController.top3Score = highScore2
                secondViewController.top1ID = idNumber
                secondViewController.top2ID = highScore1ID
                secondViewController.top3ID = highScore2ID
            } else if yourScore >= highScore2 {
                secondViewController.top1Score = highScore1
                secondViewController.top2Score = yourScore
                secondViewController.top3Score = highScore2
                secondViewController.top1ID = highScore1ID
                secondViewController.top2ID = idNumber
                secondViewController.top3ID = highScore2ID
            } else if yourScore >= highScore3 {
                secondViewController.top1Score = highScore1
                secondViewController.top2Score = highScore2
                secondViewController.top3Score = yourScore
                secondViewController.top1ID = highScore1ID
                secondViewController.top2ID = highScore2ID
                secondViewController.top3ID = idNumber
            } else {
                secondViewController.top1Score = highScore1
                secondViewController.top2Score = highScore2
                secondViewController.top3Score = highScore3
                secondViewController.top1ID = highScore1ID
                secondViewController.top2ID = highScore2ID
                secondViewController.top3ID = highScore3ID
            }
        }
    }

}

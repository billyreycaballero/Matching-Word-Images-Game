//
//  GameOverViewController.swift
//  Matching Game
//
//  Created by alcoderithm on 7/12/18.
//  Copyright © 2018 alcoderithm. All rights reserved.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var yourScore: UILabel!
    @IBOutlet weak var topOneScore: UILabel!
    @IBOutlet weak var topTwoScore: UILabel!
    @IBOutlet weak var topThreeScore: UILabel!
    var yourFinalScore = 0
    var top1Score = 0
    var top2Score = 0
    var top3Score = 0
    var yourID = 0
    var top1ID = 0
    var top2ID = 0
    var top3ID = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        yourScore.text = "ID\(yourID) Score is \(yourFinalScore)"
        topOneScore.text = "1. ID\(top1ID) = \(top1Score)"
        topTwoScore.text = "2. ID\(top2ID) = \(top2Score)"
        topThreeScore.text = "3. ID\(top3ID) = \(top3Score)"
    }
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let firstViewController = segue.destination as? GamePlayViewController {
            firstViewController.highScore1 = top1Score
            firstViewController.highScore2 = top2Score
            firstViewController.highScore3 = top3Score
            firstViewController.idNumber = yourID
            firstViewController.highScore1ID = top1ID
            firstViewController.highScore2ID = top2ID
            firstViewController.highScore3ID = top3ID
        }
    }

}

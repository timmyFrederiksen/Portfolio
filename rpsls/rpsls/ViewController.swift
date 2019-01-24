//
//  ViewController.swift
//  rpsls
//
//  Created by 90303122 on 10/4/18.
//  Copyright © 2018 90303122. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func findWinner1(userHand: integer_t, cpuHand: integer_t) -> integer_t {
       // 1--cpu wins / 2--cpu loses / 3--tie
               if (userHand == 1 && (cpuHand == 2 || cpuHand == 5)) {
                return 1
        } else if (userHand == 1 && (cpuHand == 3 || cpuHand == 4)) {
                return 2
        } else if (userHand == 2 && (cpuHand == 3 || cpuHand == 4)) {
                return 1
        } else if (userHand == 2 && (cpuHand == 1 || cpuHand == 5)) {
                return 2
        } else if (userHand == 3 && (cpuHand == 1 || cpuHand == 5)) {
                return 1
        } else if (userHand == 3 && (cpuHand == 2 || cpuHand == 4)) {
                return 2
        } else if (userHand == 4 && (cpuHand == 1 || cpuHand == 3)) {
                return 1
        } else if (userHand == 4 && (cpuHand == 2 || cpuHand == 5)) {
                return 2
        } else if (userHand == 5 && (cpuHand == 2 || cpuHand == 4)) {
                return 1
        } else if (userHand == 5 && (cpuHand == 1 || cpuHand == 3)) {
                return 2
               } else {
                return 3
        }
      
    }
    
    var totalWins = 0
    var gamesPlayed = 0
    var difficulty = 1
    var cpuPick = 0
    var userPick = 0
    var result = 0
    //rock 1
    //paper 2
    //scissors 3
    //lizard 4
    //spock 5
    
    @IBAction func changeToBaby(_ sender: Any) {
        difficulty = 1
        resultLabel.text = "WAAaaaAAaAhhh"
        userBox.image = UIImage(named: "")
        cpuBox.image = UIImage(named: "")
    }
    
    @IBAction func changeToTeen(_ sender: Any) {
        difficulty = 2
        resultLabel.text = "ur dumb"
        userBox.image = UIImage(named: "")
        cpuBox.image = UIImage(named: "")
    }
    
    @IBAction func changeToGrandmaster(_ sender: Any) {
        difficulty = 3
        resultLabel.text = "Ah! A challenger"
        userBox.image = UIImage(named: "")
        cpuBox.image = UIImage(named: "")
    }
    
    
    @IBOutlet weak var userBox: UIImageView!
    @IBOutlet weak var cpuBox: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var winsLabel: UILabel!
    @IBOutlet weak var winLossLabel: UILabel!
    
    
    @IBAction func resetStats(_ sender: Any) {
        totalWins = 0
        gamesPlayed = 0
        winLossLabel.text = "W/L: N/A"
        winsLabel.text = "Wins: 0"
        resultLabel.text = "lost a few too many times, Eh?"
        userBox.image = UIImage(named: "")
        cpuBox.image = UIImage(named: "")
    }
    
    @IBAction func userRock(_ sender: Any) {
        if (difficulty == 1) {
            let userPick = 1
            userBox.image = UIImage(named: "Image1")
            let cpuPick = arc4random_uniform(5) + 1
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else if (difficulty == 2) {
            userPick = Int(arc4random_uniform(5) + 1)
            userBox.image = UIImage(named: "Image\(userPick)")
            cpuPick = Int(arc4random_uniform(5) + 1)
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else {
            let userPick = 1
            userBox.image = UIImage(named: "Image1")
            let cpuPick = 2
            cpuBox.image = UIImage(named: "Image2")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        }
        if (result == 1) {
            resultLabel.text = "You lose: you thought you'd win against ME"
        } else if (result == 2) {
            resultLabel.text = "You win: don't get cocky"
            totalWins += 1
            winsLabel.text = "Wins: \(totalWins)"
        } else {
            resultLabel.text = "Tie: I just read your mind to make you tie me"
        }
            gamesPlayed += 1
            let wlPercent = Int(100 * Double(totalWins)/Double(gamesPlayed))
            winLossLabel.text = "W/L: \(wlPercent)%"
    }
    
    @IBAction func userPaper(_ sender: Any) {
        if (difficulty == 1) {
            let userPick = 2
            userBox.image = UIImage(named: "Image2")
            let cpuPick = arc4random_uniform(5) + 1
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else if (difficulty == 2) {
            userPick = Int(arc4random_uniform(5) + 1)
            userBox.image = UIImage(named: "Image\(userPick)")
            cpuPick = Int(arc4random_uniform(5) + 1)
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else {
            let userPick = 2
            userBox.image = UIImage(named: "Image2")
            let cpuPick = 3
            cpuBox.image = UIImage(named: "Image3")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        }
        if (result == 1) {
            resultLabel.text = "You lose: Plz ez, get rekt scrub, not even good"
        } else if (result == 2) {
            resultLabel.text = "You win: whatever, you won on ez mode"
            totalWins += 1
            winsLabel.text = "Wins: \(totalWins)"
        } else {
            resultLabel.text = "Tie: you are okay i guess ... scrub"
        }
            gamesPlayed += 1
            let wlPercent = Int(100 * Double(totalWins)/Double(gamesPlayed))
            winLossLabel.text = "W/L: \(wlPercent)%"
    }
    
    @IBAction func userScissors(_ sender: Any) {
        if (difficulty == 1) {
            let userPick = 3
            userBox.image = UIImage(named: "Image3")
            let cpuPick = arc4random_uniform(5) + 1
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else if (difficulty == 2) {
            userPick = Int(arc4random_uniform(5) + 1)
            userBox.image = UIImage(named: "Image\(userPick)")
            cpuPick = Int(arc4random_uniform(5) + 1)
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else {
            let userPick = 3
            userBox.image = UIImage(named: "Image3")
            let cpuPick = 1
            cpuBox.image = UIImage(named: "Image1")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        }
        if (result == 1) {
            resultLabel.text = "You lose: pro Tip: don't choose Scissors"
        } else if (result == 2) {
            resultLabel.text = "You win: for all your losses, you needed that"
            totalWins += 1
            winsLabel.text = "Wins: \(totalWins)"
        } else {
            resultLabel.text = "Tie: you are almost as good as I"
        }
            gamesPlayed += 1
            let wlPercent = Int(100 * Double(totalWins)/Double(gamesPlayed))
            winLossLabel.text = "W/L: \(wlPercent)%"
    }
    
    @IBAction func userLizard(_ sender: Any) {
        if (difficulty == 1) {
            let userPick = 4
            userBox.image = UIImage(named: "Image4")
            let cpuPick = arc4random_uniform(5) + 1
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else if (difficulty == 2) {
            userPick = Int(arc4random_uniform(5) + 1)
            userBox.image = UIImage(named: "Image\(userPick)")
            cpuPick = Int(arc4random_uniform(5) + 1)
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else {
            let userPick = 4
            userBox.image = UIImage(named: "Image4")
            let cpuPick = 1
            cpuBox.image = UIImage(named: "Image1")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        }
        if (result == 1) {
            resultLabel.text = "Are you for real? sooooooo bad"
        } else if (result == 2) {
            resultLabel.text = "You win: FINALLY, sheesh"
            totalWins += 1
            winsLabel.text = "Wins: \(totalWins)"
        } else {
            resultLabel.text = "Tie: so close yet so far"
        }
            gamesPlayed += 1
            let wlPercent = Int(100 * Double(totalWins)/Double(gamesPlayed))
            winLossLabel.text = "W/L: \(wlPercent)%"
    }
    
    @IBAction func userSpock(_ sender: Any) {
        if (difficulty == 1) {
            let userPick = 5
            userBox.image = UIImage(named: "Image5")
            let cpuPick = arc4random_uniform(5) + 1
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else if (difficulty == 2) {
            userPick = Int(arc4random_uniform(5) + 1)
            userBox.image = UIImage(named: "Image\(userPick)")
            cpuPick = Int(arc4random_uniform(5) + 1)
            cpuBox.image = UIImage(named: "Image\(cpuPick)")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        } else {
            let userPick = 5
            userBox.image = UIImage(named: "Image5")
            let cpuPick = 4
            cpuBox.image = UIImage(named: "Image4")
            result = Int(findWinner1(userHand: integer_t(userPick), cpuHand: integer_t(cpuPick)))
        }
        if (result == 1) {
            resultLabel.text = "You lose: Unbelievable, you can count, right?"
        } else if (result == 2) {
            resultLabel.text = "You win: LAAAAAAAAG"
            totalWins += 1
            winsLabel.text = "Wins: \(totalWins)"
        } else {
            resultLabel.text = "Tie: not good enough"
        }
            gamesPlayed += 1
            let wlPercent = Int(100 * Double(totalWins)/Double(gamesPlayed))
            winLossLabel.text = "W/L: \(wlPercent)%"
    }
    
    
    
    // difficulty buttons selection color
    // vibrations
    // difficulty buttons same size
    // win loss bar
}


//
//  ViewController.swift
//  periodicTableClicker
//
//  Created by 90303122 on 10/29/18.
//  Copyright © 2018 90303122. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    @IBOutlet weak var numAtomsLabel: UILabel!
    @IBOutlet weak var manualUpgradeLabel: UILabel!
    @IBOutlet weak var idleUpgradeLabel: UILabel!
    @IBOutlet weak var elementImage: UIImageView!
    @IBOutlet weak var advanceElement: UIButton!
    
    var continuousPlus = Timer()
    var numAtoms: Int = 0
    var typeAtom: String = "Hydrogen-1"
    var numPerClick = 1
    var numPerIdleClick = 0
    var levelAtom = 0
    var multiManual: Int = 1
    var multiIdle: Int = 1
    var levelIdle: Int = 0
    var levelManual: Int = 1
    
    var manualCostArray: [Int] = [0, 30, 100, 430, 1250, 3000, 7500, 9400, 12555, 15000, 20000, 22500, 25000, 27500, 30000, 35000, 40000, 43300, 45000, 46900, 48000, 50000, 65000, 77500, 90000, 125000]
    var idleCostArray: [Int] = [10, 50, 350, 1000, 2300, 3500, 5000, 7200, 8890, 10000, 12230, 14300, 17450, 20000, 22402, 25000, 27500, 32100, 33900, 35000, 40000, 43540, 50220, 60000, 75000, 100000]
    
    var elementArray: [String] = ["Hydrogen-1", "Hydrogen-2", "Helium-3", "Helium-4", "Lithium-6", "Lithium-7", "Beryllium-9", "Boron-10", "Boron-11", "Carbon-12", "Carbon-13", "Nitrogen-14", "Nitrogen-15", "Oxygen-16", "Oxygen-17", "Fluorine-19", "Neon-20", "Neon-21", "Sodium-23", "Magnesium-24", "Magnesium-25", "Magnesium-26", "Silicon-28", "Silicon-29", "Silicon-30", "Phosphorus-31", "Sulfur-32", "Sulfur-33", "Sulfur-34", "Sulfur-36", "Chlorine-35", "Chlorine-37", "Argon-36", "Argon-38", "Argon-40"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continuousPlus = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.incrementAtoms), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func clickElement(_ sender: Any) {
        numAtoms += numPerClick
        numAtomsLabel.text = "\(numAtoms) \(typeAtom)"
    }
    
    @objc func incrementAtoms() {
        numAtoms += numPerIdleClick
        numAtomsLabel.text = "\(numAtoms) \(typeAtom)"
    }
    
    @IBAction func advance(_ sender: Any) {
        if (numAtoms >= (levelAtom * 1000)) {
            numAtoms = numAtoms / 10
            levelAtom += 1
            typeAtom = elementArray[levelAtom]
            numAtomsLabel.text = "\(numAtoms) \(typeAtom)"
            elementImage.image = UIImage(named: "\(elementArray[levelAtom])")
            advanceElement.setTitle("Advance to next element (Cost: \(1000 * (1 + levelAtom))", for: .normal)
        }
    }
    
    @IBAction func upgradeClick(_ sender: Any) {
        if (numAtoms >= manualCostArray[numPerClick]) {
            numAtoms -= manualCostArray[numPerClick]
            numPerClick += 1
        manualUpgradeLabel.text = "Click Power (Level \(numPerClick)) Cost: \(manualCostArray[numPerClick])"
        }
    }
    
    @IBAction func upgradeIdle(_ sender: Any) {
        if (numAtoms >= idleCostArray[levelIdle] && levelIdle != 25) {
            numPerIdleClick += multiIdle
            numAtoms -= idleCostArray[levelIdle]
            levelIdle += 1
            idleUpgradeLabel.text = "Idle Gain (Level \(levelIdle)) Cost: \(idleCostArray[levelIdle])"
        } else if (levelIdle == 25 && numAtoms >= idleCostArray[levelIdle]) {
            numAtoms -= idleCostArray[levelIdle]
            multiIdle += 1
            levelIdle = 0
            
        }
    }
    
    //Ideal prestige and upgrade:: when clicked: checks for numAtoms and current level, if level isnt max and can afford, then numPerIdleClick is incremented by multi, and the UI updates to change the cost and the displayed level. If cannot afford, return naked. If max level, the prestige cost is subtracted, the multi is increased and the UI changes to reflect the prestige to infrom the user. This for both manual and idle click.
    
    //To-Do: run and make sure it runs(crashes after attempt to upgrade past end of array) | add more elements to the array | Better UI | Size Classes | Prestiging
    
    
}

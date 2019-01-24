//
//  TimeDateViewController.swift
//  EPHS
//
//  Created by Jennifer Nelson on 12/19/18.
//  Copyright © 2018 EPHS. All rights reserved.
//

import UIKit

class TimeDateViewController: UIViewController {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var bottomLabel: UILabel!
    @IBOutlet weak var LeftButton: UIButton!
    @IBOutlet weak var MiddleButton: UIButton!
    @IBOutlet weak var RightButton: UIButton!
    
    var now = Date()
    let weekday = Calendar.current.component(.weekday, from: Date()) //Wed = 4, starts at Sun
    // var hrFromNow = now.addingTimeInterval(60.0 * 60.0) //number of seconds to add
    let calendar = Calendar.current
    
    var seven_fifty: Date = Date()
    var nine_seventeen: Date = Date()
    var nine_twenty_five: Date = Date()
    var ten_fifty_two: Date = Date()
    var eleven: Date = Date()
    var one: Date = Date()
    var one_eight: Date = Date()
    var two_thirty_five: Date = Date()
    var sub1: Date = Date()
    var sub2: Date = Date()
    var sub3: Date = Date()
    var sub4: Date = Date()
    
    var timer = Timer()
    var ticker = false
    var a = 0.0 //used for timeIntervalSinceNow to make it look nicer
    
    override func viewDidLoad() {
        LeftButton.layer.cornerRadius = 15
        RightButton.layer.cornerRadius = 15
        MiddleButton.layer.cornerRadius = 15
        LeftButton.layer.borderColor = UIColor.white.cgColor
        LeftButton.layer.borderWidth = 1.0
        RightButton.layer.borderColor = UIColor.white.cgColor
        RightButton.layer.borderWidth = 1.0
        MiddleButton.layer.borderColor = UIColor.white.cgColor
        MiddleButton.layer.borderWidth = 1.0
        let backgroundImage = UIImageView(frame: UIScreen.main.bounds)
        backgroundImage.image = UIImage(named: "Cool Ass Pgoto-1.png")
        backgroundImage.contentMode = UIView.ContentMode.scaleAspectFill
        self.view.insertSubview(backgroundImage, at: 0)
        print(weekday)
        super.viewDidLoad()
        if (weekday == 1 || weekday == 7){
            bottomLabel.text = "It's the weekend, relax!"
        } else if (weekday % 2 == 0){ //even weekdays are Mon, Wed, Fri
            setClocksToNormal()
        } else if (weekday == 3){ //Tuesday (zero hr)
            setClocksToZeroHr()
        } else if (weekday == 5){ //Thursday (CORE)
            setClocksToCORE()
        }
    }
    
    @objc func makeTimesNormalDay(){ //uses obj-C so #selector can grab it, idk I got it from Internet
        now = Date()
        topLabel.text = DateFormatter.localizedString(from: now, dateStyle: .none, timeStyle: .long)
        if now <= seven_fifty {
            bottomUpdate(date: seven_fifty, s: "1st Hour begins\n (Normal day)", inSession: true)
        } else if now <= nine_seventeen {
            bottomUpdate(date: nine_seventeen, s: "1st Hour ends\n (Normal day)", inSession: true)
        } else if now <= nine_twenty_five {
            bottomUpdate(date: nine_twenty_five, s: "2nd Hour begins\n (Normal day)", inSession: true)
        } else if now <= ten_fifty_two {
            bottomUpdate(date: ten_fifty_two, s: "2nd Hour ends\n (Normal day)", inSession: true)
        } else if now <= eleven {
            bottomUpdate(date: eleven, s: "3rd Hour begins\n (Normal day)", inSession: true)
        } else if now <= one {
            bottomUpdate(date: one, s: "3rd Hour ends\n (Normal day)", inSession: true)
        } else if now <= one_eight {
            bottomUpdate(date: one_eight, s: "4th Hour begins\n (Normal day)", inSession: true)
        } else if now <= two_thirty_five {
            bottomUpdate(date: two_thirty_five, s: "school ends", inSession: true)
        } else {
            bottomUpdate(date: Date(), s: "", inSession: false)
        }
    }
    @objc func makeTimesZeroHrDay(){ //uses obj-C so #selector can grab it, idk I got it from Internet
        now = Date()
        topLabel.text = DateFormatter.localizedString(from: now, dateStyle: .none, timeStyle: .long)
        if now <= seven_fifty {
            bottomUpdate(date: seven_fifty, s: "Zero Hour begins", inSession: true)
        } else if now <= nine_seventeen {
            bottomUpdate(date: nine_seventeen, s: "Zero Hour ends", inSession: true)
        } else if now <= nine_twenty_five {
            bottomUpdate(date: nine_twenty_five, s: "1st Hour begins\n(Zero Hour day)", inSession: true)
        } else if now <= ten_fifty_two {
            bottomUpdate(date: ten_fifty_two, s: "1st Hour ends\n(Zero Hour day)", inSession: true)
        } else if now <= eleven {
            bottomUpdate(date: eleven, s: "Connections begins", inSession: true)
        } else if now <= one {
            bottomUpdate(date: one, s: "Connections ends", inSession: true)
        } else if now <= one_eight {
            bottomUpdate(date: one_eight, s: "2nd Hour begins\n(Zero Hour day)", inSession: true)
        } else if now <= two_thirty_five {
            bottomUpdate(date: two_thirty_five, s: "2nd Hour ends\n(Zero Hour day)", inSession: true)
        } else if now <= sub1 {
            bottomUpdate(date: sub1, s: "3rd Hour begins\n(Zero Hour day)", inSession: true)
        } else if now <= sub2 {
            bottomUpdate(date: sub2, s: "3rd Hour ends\n(Zero Hour day)", inSession: true)
        } else if now <= sub3 {
            bottomUpdate(date: sub3, s: "4th Hour begins\n(Zero Hour day)", inSession: true)
        } else if now <= sub4 {
            bottomUpdate(date: sub4, s: "school ends", inSession: true)
        } else {
            bottomUpdate(date: Date(), s: "", inSession: false)
        }
    }
    
    @objc func makeTimesCOREDay(){ //uses obj-C so #selector can grab it, idk I got it from Internet
        now = Date()
        topLabel.text = DateFormatter.localizedString(from: now, dateStyle: .none, timeStyle: .long)
        if now <= seven_fifty {
            bottomUpdate(date: seven_fifty, s: "1st Hour begins\n(CORE day)", inSession: true)
        } else if now <= nine_seventeen {
            bottomUpdate(date: nine_seventeen, s: "1st Hour ends\n(CORE day)", inSession: true)
        } else if now <= nine_twenty_five {
            bottomUpdate(date: nine_twenty_five, s: "CORE begins", inSession: true)
        } else if now <= ten_fifty_two {
            bottomUpdate(date: ten_fifty_two, s: "CORE ends", inSession: true)
        } else if now <= eleven {
            bottomUpdate(date: eleven, s: "2nd Hour begins\n(CORE day)", inSession: true)
        } else if now <= one {
            bottomUpdate(date: one, s: "2nd Hour ends\n(CORE day)", inSession: true)
        } else if now <= one_eight {
            bottomUpdate(date: one_eight, s: "3rd Hour begins\n(CORE day)", inSession: true)
        } else if now <= two_thirty_five {
            bottomUpdate(date: two_thirty_five, s: "3rd Hour ends\n(CORE day)", inSession: true)
        } else if now <= sub1 {
            bottomUpdate(date: sub1, s: "4th Hour begins\n(CORE day)", inSession: true)
        } else if now <= sub2 {
            bottomUpdate(date: sub2, s: "school ends", inSession: true)
        }  else {
            bottomUpdate(date: Date(), s: "", inSession: false)
        }
    }
    
    func bottomUpdate(date: Date, s: String, inSession: Bool){
        if (inSession){
            a = date.timeIntervalSinceNow
            bottomLabel.text = String(Int(a/60)+1) + " minutes until \n" + s
        } else {
            bottomLabel.text = "school has ended for today"
        }
    }
    
    func setClocksToNormal(){
        seven_fifty = calendar.date(
            bySettingHour: 7,
            minute: 50,
            second: 0,
            of: now)!
        nine_seventeen = calendar.date(
            bySettingHour: 9,
            minute: 17,
            second: 0,
            of: now)!
        nine_twenty_five = calendar.date(
            bySettingHour: 9,
            minute: 25,
            second: 0,
            of: now)!
        ten_fifty_two = calendar.date(
            bySettingHour: 10,
            minute: 52,
            second: 0,
            of: now)!
        eleven = calendar.date(
            bySettingHour: 11,
            minute: 0,
            second: 0,
            of: now)!
        one = calendar.date(
            bySettingHour: 13,
            minute: 0,
            second: 0,
            of: now)!
        one_eight = calendar.date(
            bySettingHour: 13,
            minute: 08,
            second: 0,
            of: now)!
        two_thirty_five = calendar.date(
            bySettingHour: 14,
            minute: 35,
            second: 0,
            of: now)!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.makeTimesNormalDay) , userInfo: nil, repeats: true)
    }
    
    func setClocksToZeroHr(){
        seven_fifty = calendar.date( //7:15
            bySettingHour: 7,
            minute: 15,
            second: 0,
            of: now)!
        nine_seventeen = calendar.date( //8:15
            bySettingHour: 8,
            minute: 15,
            second: 0,
            of: now)!
        nine_twenty_five = calendar.date( //8:20
            bySettingHour: 8,
            minute: 20,
            second: 0,
            of: now)!
        ten_fifty_two = calendar.date( //9:30
            bySettingHour: 9,
            minute: 30,
            second: 0,
            of: now)!
        eleven = calendar.date( //9:37
            bySettingHour: 9,
            minute: 37,
            second: 0,
            of: now)!
        one = calendar.date( //9:57
            bySettingHour: 9,
            minute: 57,
            second: 0,
            of: now)!
        one_eight = calendar.date( //10:04
            bySettingHour: 10,
            minute: 04,
            second: 0,
            of: now)!
        two_thirty_five = calendar.date( //11:14
            bySettingHour: 11,
            minute: 14,
            second: 0,
            of: now)!
        sub1 = calendar.date( //11:21
            bySettingHour: 11,
            minute: 21,
            second: 0,
            of: now)!
        sub2 = calendar.date( //1:18
            bySettingHour: 13,
            minute: 18,
            second: 0,
            of: now)!
        sub3 = calendar.date( //1:25
            bySettingHour: 13,
            minute: 25,
            second: 0,
            of: now)!
        sub4 = calendar.date( //2:35
            bySettingHour: 14,
            minute: 35,
            second: 0,
            of: now)!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.makeTimesZeroHrDay) , userInfo: nil, repeats: true)
    }
    
    func setClocksToCORE(){
        seven_fifty = calendar.date( //7:50
            bySettingHour: 7,
            minute: 50,
            second: 0,
            of: now)!
        nine_seventeen = calendar.date( //9:05
            bySettingHour: 9,
            minute: 05,
            second: 0,
            of: now)!
        nine_twenty_five = calendar.date( //9:12
            bySettingHour: 9,
            minute: 12,
            second: 0,
            of: now)!
        ten_fifty_two = calendar.date( //9:57
            bySettingHour: 9,
            minute: 57,
            second: 0,
            of: now)!
        eleven = calendar.date( //10:04
            bySettingHour: 10,
            minute: 04,
            second: 0,
            of: now)!
        one = calendar.date( //11:14
            bySettingHour: 11,
            minute: 14,
            second: 0,
            of: now)!
        one_eight = calendar.date( //11:21
            bySettingHour: 11,
            minute: 21,
            second: 0,
            of: now)!
        two_thirty_five = calendar.date( //1:18
            bySettingHour: 13,
            minute: 18,
            second: 0,
            of: now)!
        sub1 = calendar.date( //1:25
            bySettingHour: 13,
            minute: 25,
            second: 0,
            of: now)!
        sub2 = calendar.date( //2:35
            bySettingHour: 14,
            minute: 35,
            second: 0,
            of: now)!
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(self.makeTimesCOREDay) , userInfo: nil, repeats: true)
    }
    @IBAction func leftButtonPressed(_ sender: Any) {
        LeftButton.backgroundColor = UIColor.darkGray
        RightButton.backgroundColor = UIColor.clear
        MiddleButton.backgroundColor = UIColor.clear
        timer.invalidate()
        setClocksToCORE()
    }
    @IBAction func rightButtonPressed(_ sender: Any) {
        LeftButton.backgroundColor = UIColor.clear
        RightButton.backgroundColor = UIColor.darkGray
        MiddleButton.backgroundColor = UIColor.clear
        timer.invalidate()
        setClocksToZeroHr()
    }
    @IBAction func middleButtonPressed(_ sender: Any) {
        LeftButton.backgroundColor = UIColor.clear
        RightButton.backgroundColor = UIColor.clear
        MiddleButton.backgroundColor = UIColor.darkGray
        timer.invalidate()
        setClocksToNormal()
    }
    
    

}

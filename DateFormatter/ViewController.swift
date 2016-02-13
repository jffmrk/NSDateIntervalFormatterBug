//
//  ViewController.swift
//  DateFormatter
//
//  Created by Jeff on 2/12/16.
//
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var dateIntervalLabel: UILabel!

    private var timer: NSTimer?
    private var offset: NSTimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didEnterBackground", name: UIApplicationDidEnterBackgroundNotification, object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "didBecomeActive", name: UIApplicationDidBecomeActiveNotification, object: nil)
        self.didBecomeActive()
    }

    func didBecomeActive() {
        self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateLabels", userInfo: nil, repeats: true)
    }

    func didEnterBackground() {
        self.timer?.invalidate()
        self.timer = nil
    }

    @IBAction func toggleTimer() {
        if let timer = self.timer {
            timer.invalidate()
            self.timer = nil
        }
        else {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "updateLabels", userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func addSixHours() {
        self.offset += 21600
        updateLabels()
    }
    
    @IBAction func subtractSixHours() {
        self.offset -= 21600
        updateLabels()
    }
    
    func updateLabels() {
        let now = NSDate(timeIntervalSinceNow: self.offset)
        let next = NSDate(timeInterval: 14400, sinceDate: now)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .MediumStyle
        dateFormatter.timeStyle = .LongStyle
        let str = dateFormatter.stringFromDate(now)
        self.dateLabel.text = str
        
        let dateIntervalFormatter = NSDateIntervalFormatter()
        dateIntervalFormatter.dateStyle = .MediumStyle
        dateIntervalFormatter.timeStyle = .LongStyle
        let strInterval = dateIntervalFormatter.stringFromDate(now, toDate: next)
        self.dateIntervalLabel.text = strInterval
    }
    
}


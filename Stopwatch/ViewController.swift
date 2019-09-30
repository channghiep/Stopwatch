//
//  ViewController.swift
//  Stopwatch
//
//  Created by Colin Masters on 2019-09-23.
//  Copyright © 2019 Langara. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var stopwatchLabel: UILabel!
    
    let stopwatch = Stopwatch()
    var timer: Timer!
    var isPaused = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @objc func updateTimelabel() {
        if stopwatch.isRunning {
            stopwatchLabel.text = stopwatch.elapsedTimeAsString
        } else {
            timer.invalidate()
            stopwatchLabel.text = "00:00.0"
        }
    }
    
    // MARK: - Actions

    @IBAction func startButtonTapped(_ sender: UIButton) {

        if isPaused == false{
            if stopwatch.isRunning{
                timer.invalidate()
                stopwatch.start()
                
                timer = Timer.scheduledTimer(timeInterval: 0.1,
                                             target: self,
                                             selector: #selector(updateTimelabel),
                                             userInfo: nil,
                                             repeats: true)
            }
            else{
                stopwatch.start()
                timer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(updateTimelabel),
                                         userInfo: nil,
                                         repeats: true)
            }
        }
        else{
                timer = Timer.scheduledTimer(timeInterval: 0.1,
                                         target: self,
                                         selector: #selector(updateTimelabel),
                                         userInfo: nil,
                                         repeats: true)

                isPaused = false
        }
        
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
            timer.invalidate()
            isPaused = true
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        stopwatch.reset()
        updateTimelabel()
        isPaused = false
    }
}


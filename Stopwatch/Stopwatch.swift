//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Colin Masters on 2019-09-23.
//  Copyright © 2019 Langara. All rights reserved.
//

import Foundation

class Stopwatch {
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
            
        } else {
            return 0
        }
    }
    
    var elapsedTimeAsString: String {
        let minutes = Int(elapsedTime / 60)
        let seconds = Int(elapsedTime.truncatingRemainder(dividingBy: 60))
        let tenthsOfSeconds = Int((elapsedTime * 10).truncatingRemainder(dividingBy: 10))
        return String(format: "%02d:%02d.%d", minutes, seconds, tenthsOfSeconds)
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    private var startTime: Date?
    
    func start() {
        startTime = Date()
    }
    
    func reset() {
        startTime = nil
    }
}

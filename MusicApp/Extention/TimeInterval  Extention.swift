//
//  TimeInterval  Extention.swift
//  MusicApp
//
//  Created by Amir lahav on 08/03/2019.
//  Copyright © 2019 la-labs. All rights reserved.
//

import Foundation

extension TimeInterval {
    var minuteSecondMS: String {
        return String(format:"%d:%02d", minute, second)
    }
    var minute: Int {
        return Int((self/60).truncatingRemainder(dividingBy: 60))
    }
    var second: Int {
        return Int(truncatingRemainder(dividingBy: 60))
    }
}

extension Int {
    var msToSeconds: Double {
        return Double(self) / 1000
    }
}

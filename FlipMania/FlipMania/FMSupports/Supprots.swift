//
//  Supprots.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

/**
 Runs a block in the main thread
 **/
public func runOnMainThread(_ block: @escaping () -> ()) {
    DispatchQueue.main.async(execute: {
        block()
    })
}

/**
 Runs a block in background
 */
public func runInBackground(_ block: @escaping () -> ()) {
    
    DispatchQueue.global(qos: .userInitiated).async {
        block()
    }
}

/**
 Runs a block after specific time
 **/

public func runAfterTime(_ time: Double ,block : @escaping () -> ()){
    let delayTime = DispatchTime.now() + Double(Int64(time * Double(NSEC_PER_SEC))) / Double(NSEC_PER_SEC)
    DispatchQueue.main.asyncAfter(deadline: delayTime) {
        block()
    }
}

/// Convert Int to String
extension Int {
    func toString() -> String {
        let myString = String(self)
        return myString
    }
}

/// Convert Double to String
extension Double {
    func toString() -> String {
        let myString = String(self)
        return myString
    }
}

/// Convert Int64 to String
extension Int64 {
    func toString() -> String {
        let myString = String(self)
        return myString
    }
}

/// Convert String to Int
extension String {
    public func toInt() -> Int? {
        if let num = NumberFormatter().number(from: self) {
            return num.intValue
        } else {
            return nil
        }
    }
}

/// Convert String to Double
extension String {
    public func toDouble() -> Double? {
        if let num = NumberFormatter().number(from: self) {
            return num.doubleValue
        } else {
            return nil
        }
    }
}

extension UIColor {
    static func random() -> UIColor {
        return UIColor(
            red:   .random(),
            green: .random(),
            blue:  .random(),
            alpha: 1.0
        )
    }
    
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}


extension UserDefaults {
    enum Keys: String, CaseIterable {
        case wrongCount
        case rightCount
        case bgImage
        case soundOnOff
        case flipflopImage
    }
    
    func reset() {
        Keys.allCases.forEach { removeObject(forKey: $0.rawValue) }
    }
}

extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }
    
    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
        }
        set(colorData, forKey: key)
    }
}

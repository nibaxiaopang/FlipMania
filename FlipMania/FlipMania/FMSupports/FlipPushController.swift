//
//  MMFPushController.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class FlipPushController: NSObject {
    
    var storyBoard = UIStoryboard(name: "Main", bundle: nil)
    
    func MMFHome() -> FlipHomeViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFHome") as! FlipHomeViewController
    }
    func MMFStats() -> FlipStatsViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFStats") as! FlipStatsViewController
    }
    func MMFPref() -> FlipPrefViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFPref") as! FlipPrefViewController
    }
    func MMFBG() -> FlipBGViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFBG") as! FlipBGViewController
    }
    func MMFFlipFlopSelect() -> FlipFlopSelectViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFFlipFlopSelect") as! FlipFlopSelectViewController
    }   
    func MMFFlipFlopHistory() -> FlipFlopHistoryViewController {
        return storyBoard.instantiateViewController(withIdentifier: "MMFFlipFlopHistory") as! FlipFlopHistoryViewController
    }
}

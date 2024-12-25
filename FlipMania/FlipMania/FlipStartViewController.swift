//
//  ViewController.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

import UIKit

class FlipStartViewController: FlipBaseController {
    
    
    ////1. Add option to select front flipflop or back flipflop for win
    ///2. Select different of flipflop styles for customization
    ///3. Also add your choise is Back or Front with image in Home screen, so user know the winning.
    ///-----> ADD THESE 2 SCREENS.

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        
        showBackButton(isHide: true)
    }
}


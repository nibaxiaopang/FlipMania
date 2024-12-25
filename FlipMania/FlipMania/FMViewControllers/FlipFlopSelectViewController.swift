//
//  MMFFlipFlopSelect.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class FlipFlopSelectViewController: FlipBaseController {
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        btn1.setOnClictAction {
            UserDefaults.standard.set("ic_flipflop_1", forKey: UserDefaults.Keys.flipflopImage.rawValue)
            self.alertShowMessageSent(text: "Default Selected")
        }
        
        btn2.setOnClictAction {
            UserDefaults.standard.set("ic_flipflop_2", forKey: UserDefaults.Keys.flipflopImage.rawValue)
            self.alertShowMessageSent(text: "Default Selected")
        }
        
        btn3.setOnClictAction {
            UserDefaults.standard.set("ic_flipflop_3", forKey: UserDefaults.Keys.flipflopImage.rawValue)
            self.alertShowMessageSent(text: "Default Selected")
        }
        
        btn4.setOnClictAction {
            UserDefaults.standard.set("ic_flipflop_4", forKey: UserDefaults.Keys.flipflopImage.rawValue)
            self.alertShowMessageSent(text: "Default Selected")
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        
        showBackButton(isHide: false)
    }

}

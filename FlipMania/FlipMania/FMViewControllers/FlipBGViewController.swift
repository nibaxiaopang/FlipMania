//
//  MMFBG.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class FlipBGViewController: FlipBaseController {
    
    var randomColor: UIColor?
    
    @IBOutlet weak var btnRandomColor: UIButton!
    @IBOutlet weak var btnDefault: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnDefault.setOnClictAction {
            let dest = FlipPushController().MMFFlipFlopSelect()
            self.navigationController?.pushViewController(dest, animated: true)
        }

        btnRandomColor.setOnClictAction { [self] in
            randomColor = UIColor.random().withAlphaComponent(0.8)
            UIView.animate(withDuration: 1.0) { [self] in
                view.backgroundColor = randomColor
                UserDefaults.standard.setColor(color: self.randomColor, forKey: "myColor") // set
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        
        let image1 = UserDefaults.standard.value(forKey: UserDefaults.Keys.flipflopImage.rawValue) as? String ?? "ic_flipflop_1"
        btnDefault.setImage(UIImage(named: image1), for: .normal)
        
        showBackButton(isHide: false)
    }
}

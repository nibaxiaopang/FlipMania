//
//  MMFStats.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class FlipStatsViewController: FlipBaseController {
    
    @IBOutlet weak var viewWin: UIView!
    @IBOutlet weak var viewLoose: UIView!
    
    @IBOutlet weak var imgFullStats: UIImageView!
    
    @IBOutlet weak var winBarHeightCons: NSLayoutConstraint! //260 by default
    @IBOutlet weak var looseBarHeightCons: NSLayoutConstraint!
    
    @IBOutlet weak var winBarView: UIView!
    @IBOutlet weak var looseBarView: UIView!
    
    @IBOutlet weak var lblWin: UILabel!
    @IBOutlet weak var lblLoose: UILabel!
    
    var winCount:Int = 0
    var looseCount:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewWin.shadowWithRoundedCorners()
        viewLoose.shadowWithRoundedCorners()
        
        lblWin.text = "Won: \(winCount)"
        lblLoose.text = "Loose: \(looseCount)"
        
        winBarView.layer.cornerRadius = 20
        looseBarView.layer.cornerRadius = 20
        
        UIView.animate(withDuration: 1.5) { [self] in
            winBarHeightCons.constant = CGFloat(100 + (winCount * Int(1.5)))
        }
        UIView.animate(withDuration: 1.5) { [self] in
            looseBarHeightCons.constant = CGFloat(100 + (looseCount * Int(1.5)))
        }
        
        imgFullStats.isUserInteractionEnabled = true
        imgFullStats.setOnClictAction {
            let dest = FlipPushController().MMFFlipFlopHistory()
            self.navigationController?.pushViewController(dest, animated: true)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { //
            self.view.backgroundColor = myColor
        }
        showBackButton(isHide: false)
    }
}

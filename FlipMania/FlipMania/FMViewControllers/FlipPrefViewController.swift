//
//  MMFPref.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit
import StoreKit

class FlipPrefViewController: FlipBaseController {
    
    
    @IBOutlet weak var btnInfo: UIButton!
    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var btnRate: UIButton!
    @IBOutlet weak var btnFeedback: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btnRate.setOnClictAction {
            SKStoreReviewController.requestReview()
        }
        
        btnShare.setOnClictAction {
            self.shareAppNow()
        }
        
        btnInfo.setOnClictAction {
            self.showAppInfo()
        }
        
        btnFeedback.setOnClictAction {
            self.promptForFeedbackAnswer()
        }

    }
    
    func promptForFeedbackAnswer() {
        let ac = UIAlertController(title: "Share Feedback", message: "", preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            _ = ac.textFields?.first?.text ?? ""
            self.alertShowMessageWarning(text: "Thanks for sharing!")
        }

        ac.addAction(submitAction)
        present(ac, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        
        showBackButton(isHide: false)
    }

}

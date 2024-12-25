//
//  GameHistoryDATA.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit
import CoreData

class FlipHomeViewController: FlipBaseController {
    
    @IBOutlet weak var btnSound: UIButton!
    @IBOutlet weak var btnTheme: UIButton!
    @IBOutlet weak var btnStats: UIButton!
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnFlipNow: UIButton!
    
    @IBOutlet weak var lblWinLoose: UILabel!
    
    var itemData = [FlipGameHistoryDATA]()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    @IBOutlet weak var imgFlipFlop: UIImageView!
    var isSoundOn = true
    var flipFlotImage = "ic_flipflop_1"
    
    var flipFlopArray = ["up", "down", "up", "down", "up", "down", "up", "down", "up", "down"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblWinLoose.isHidden = true
        
       
        btnSound.setOnClictAction { [self] in
            isSoundOn.toggle()
            UserDefaults.standard.set(isSoundOn, forKey: UserDefaults.Keys.soundOnOff.rawValue)
            btnSound.setImage(isSoundOn ? UIImage(named: "ic_sound_on") : UIImage(named: "ic_sound_off"), for: .normal)
        }
        
        btnTheme.setOnClictAction { [self] in
            let dest = FlipPushController().MMFBG()
            self.navigationController?.pushViewController(dest, animated: true)
        }
        
        btnSettings.setOnClictAction { [self] in
            let dest = FlipPushController().MMFPref()
            self.navigationController?.pushViewController(dest, animated: true)
        }
        
        btnStats.setOnClictAction { [self] in
            let winCount = UserDefaults.standard.value(forKey: UserDefaults.Keys.rightCount.rawValue) as? Int ?? 0
            let looseCount = UserDefaults.standard.value(forKey: UserDefaults.Keys.wrongCount.rawValue) as? Int ?? 0
            
            let dest = FlipPushController().MMFStats()
            dest.looseCount = looseCount
            dest.winCount = winCount
            self.navigationController?.pushViewController(dest, animated: true)
        }
        
        btnFlipNow.setOnClictAction { [self] in
            imgFlipFlop.image = UIImage(named: flipFlotImage)
            lblWinLoose.isHidden = true
            runOnMainThread {
                self.rotateAndBounceImage()
            }
        }
    }
    
    func rotateAndBounceImage() {
        //360 rotation
        flipFlopArray.shuffle()
        
        let winCount = UserDefaults.standard.value(forKey: UserDefaults.Keys.rightCount.rawValue) as? Int ?? 0
        let looseCount = UserDefaults.standard.value(forKey: UserDefaults.Keys.wrongCount.rawValue) as? Int ?? 0
        
        if isSoundOn {
            playGameSoundWav(name: "spin")
        }
        
        imgFlipFlop.bounceAndRotate(duration: 1.0, bounceHeight: 300) { [self] in
            
            imgFlipFlop.layer.removeAllAnimations()
            let random = flipFlopArray.randomElement()
            if random == "up" {
                imgFlipFlop.image = UIImage(named: flipFlotImage)
                // win
                lblWinLoose.isHidden = false
                lblWinLoose.text = "Won"
                saveDataInCoreData(status: "Won")
                performZoomAnimation(on: lblWinLoose)
                
                UserDefaults.standard.set(winCount + 1, forKey: UserDefaults.Keys.rightCount.rawValue)
                
                if isSoundOn {
                    playGameSoundWav(name: "win")
                }
                
            } else {
                // loose
                imgFlipFlop.image = UIImage(named: "flipImage_down")
                lblWinLoose.isHidden = false
                lblWinLoose.text = "Loose"
                performZoomAnimation(on: lblWinLoose)
                
                saveDataInCoreData(status: "Loose")
                
                UserDefaults.standard.set(looseCount + 1, forKey: UserDefaults.Keys.wrongCount.rawValue)
                
                if isSoundOn {
                    playGameSoundWav(name: "lose")
                }
            }
        }
        
        UIView.animate(withDuration: 1.0, delay: 0, options: [.curveEaseInOut, .repeat], animations: {
            self.imgFlipFlop.transform = self.imgFlipFlop.transform.rotated(by: .pi)
        }) { _ in
            
            UIView.animate(withDuration: 1.0, animations: {
                self.imgFlipFlop.transform = self.imgFlipFlop.transform.rotated(by: .pi)
            })
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let soundOn = UserDefaults.standard.value(forKey: UserDefaults.Keys.soundOnOff.rawValue) as? Bool ?? true
        isSoundOn = soundOn
        btnSound.setImage(isSoundOn ? UIImage(named: "ic_sound_on") : UIImage(named: "ic_sound_off"), for: .normal)
        
        if let myColor = UserDefaults.standard.colorForKey(key: "myColor") { // get color
            self.view.backgroundColor = myColor
        }
        
        let image1 = UserDefaults.standard.value(forKey: UserDefaults.Keys.flipflopImage.rawValue) as? String ?? "ic_flipflop_1"
        flipFlotImage = image1
        imgFlipFlop.image = UIImage(named: flipFlotImage)
        
        showBackButton(isHide: true)
    }
    
    private func saveDataInCoreData(status: String) {
        
        let newItem = GameHistory(context: context)
        newItem.id = UUID().uuidString
        newItem.status = status
        newItem.dateTime = Date.getCurrentDateTime()
        
        do {
            try context.save()
        } catch {
            print("SAVE ERROR")
        }
    }
}

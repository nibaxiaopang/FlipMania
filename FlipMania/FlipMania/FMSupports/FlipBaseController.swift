//
//  MMFBaseController.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import Foundation
import UIKit
import AudioToolbox
import AVFoundation

class FlipBaseController: UIViewController {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardTouchOutside()
        showBackButton(isHide: true)
    }
    
    func playGameSound(name:String){
        let path = Bundle.main.path(forResource: "\(name).mp3", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("No Audio file found")
        }
    }
    
    func performZoomAnimation(on label: UILabel) {
        label.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        UIView.animate(withDuration: 0.5,
                       delay: 0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 0.9,
                       options: .curveEaseInOut,
                       animations: {
            label.transform = CGAffineTransform.identity
        },
                       completion: nil)
    }
    
    func playGameSoundWav(name:String){
        let path = Bundle.main.path(forResource: "\(name).wav", ofType:nil)!
        let url = URL(fileURLWithPath: path)
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
        } catch {
            print("No Audio file found")
        }
    }
    
    func moveToBackToVC(imgBack: UIImageView) {
        imgBack.isUserInteractionEnabled = true
        imgBack.setOnClictAction {
            self.popViewController()
        }
    }
    
    func popViewController() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func showBackButton(isHide: Bool) {
        self.navigationController?.isNavigationBarHidden = isHide
    }
    
    func dialNumber(number : String) {
        if let url = URL(string: "tel://\(number)"),
           UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url, options: [:], completionHandler:nil)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    func setBorderToView(view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.borderWidth = 2
        view.backgroundColor = .systemYellow
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.showBackButton(isHide: true)
    }
    
    func hideKeyboardTouchOutside() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func shareAppNow() {
        let text = "Flip Mania is a simple yet addictive game that’s all about timing, precision, and fun! Test your reflexes by tapping the flip button to swing the flip-flop and see if it lands perfectly on its front side. Win by nailing the perfect flip or try again to beat your high score! With customizable visuals and sound settings, this game is a fun challenge for players of all ages. Customizable Experience: Play the game the way you like with sound and visual settings. Track Your Progress: See how you improve over time with detailed stats.Fun for All Ages: Simple mechanics and exciting gameplay make it suitable for everyone. Download Flip Mania today and test your flipping skills—can you master the perfect flip?"
        let textToShare = [ text ]
        let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
        activityViewController.popoverPresentationController?.sourceView = self.view
        activityViewController.excludedActivityTypes = [ UIActivity.ActivityType.airDrop, UIActivity.ActivityType.postToFacebook ]
        self.present(activityViewController, animated: true, completion: nil)
    }
    
    func showAppInfo() {
        let alert = UIAlertController(title: "Version 1.0", message: "Flip Mania is a simple yet addictive game that’s all about timing, precision, and fun! Test your reflexes by tapping the flip button to swing the flip-flop and see if it lands perfectly on its front side. Win by nailing the perfect flip or try again to beat your high score! With customizable visuals and sound settings, this game is a fun challenge for players of all ages. Customizable Experience: Play the game the way you like with sound and visual settings. Track Your Progress: See how you improve over time with detailed stats.Fun for All Ages: Simple mechanics and exciting gameplay make it suitable for everyone. Download Flip Mania today and test your flipping skills—can you master the perfect flip?", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action in}))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertShowMessageWarning(text: String) {
        let alert = UIAlertController(title: "", message: text, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Try Again", style: UIAlertAction.Style.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertShowMessageSent(text: String) {
        let alert = UIAlertController(title: text, message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    func alertShowAppDetailsAdded() {
        let alert = UIAlertController(title:"Added ✅", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertAction.Style.default, handler: { action in
        }))
        self.present(alert, animated: true, completion: nil)
    }
}

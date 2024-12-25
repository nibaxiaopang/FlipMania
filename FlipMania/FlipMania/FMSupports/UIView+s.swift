//
//  UIView+s.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

extension UIView {
    
    func takeScreenshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if (image != nil) { return image! }
        return UIImage()
    }
}

extension UIView {
    
    func setOnClictAction(action :@escaping () -> Void){
        let tapRecogniser = FlipClickListener(target: self, action: #selector(onViewClicked(sender:)))
        tapRecogniser.onClick = action
        self.addGestureRecognizer(tapRecogniser)
    }
    
    @objc func onViewClicked(sender: FlipClickListener) {
        if let onClick = sender.onClick {
            onClick()
        }
    }
    
    func shadowWithRoundedCorners() {
        self.layer.cornerRadius = 12
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.8
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.clear.cgColor
    }
    
    func withCircle() {
        self.layer.cornerRadius = self.layer.frame.size.width / 2
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.shadowOffset = CGSize(width: 2, height: 2)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.8
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
    }
}

extension UIView {
    func bounceAndRotate(duration: Double = 1.0, bounceHeight: CGFloat = 20.0, completion: (() -> Void)? = nil) {
        // Create the bounce animation
        UIView.animate(withDuration: duration / 2,
                       delay: 0,
                       options: [.curveEaseOut]) {
            // Move the view upwards
            self.transform = CGAffineTransform(translationX: 0, y: -bounceHeight)
        } completion: { _ in
            UIView.animate(withDuration: duration / 2,
                           delay: 0,
                           options: [.curveEaseIn]) {
                // Bring the view back down
                self.transform = CGAffineTransform.identity
            } completion: { _ in
                // Start the rotation animation after the bounce
                UIView.animate(withDuration: duration,
                               delay: 0,
                               options: [.curveLinear]) {
                    self.transform = self.transform.rotated(by: .pi * 2)
                } completion: { _ in
                    self.transform = .identity
                    completion?()
                }
            }
        }
    }
}

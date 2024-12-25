//
//  UITableView+s.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

import UIKit

extension UITableView {
    
    func setEmptyView(title: String, message: String) {
        
        let emptyView = UIView(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        
        let titleLabel = UILabel()
        let messageLabel = UILabel()
        
        titleLabel.numberOfLines = 0
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textColor = .black
        titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 18)
        
        messageLabel.textColor = .black
        messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 17)
        
        emptyView.addSubview(titleLabel)
        emptyView.addSubview(messageLabel)
        
        titleLabel.topAnchor.constraint(equalTo: emptyView.centerYAnchor, constant: -60).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
        
        messageLabel.widthAnchor.constraint(equalToConstant: self.bounds.size.width - 20).isActive = true
        
        titleLabel.text = title
        messageLabel.text = message
        messageLabel.sizeToFit()
        messageLabel.numberOfLines = 10
        messageLabel.textAlignment = .center
        
        self.backgroundView = emptyView
        self.separatorStyle = .none
    }
    
    func setEmptyMessage(_ message: String) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = .black
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont(name: "TrebuchetMS", size: 16)
        messageLabel.sizeToFit()
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}

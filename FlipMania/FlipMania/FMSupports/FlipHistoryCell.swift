//
//  MMFHistoryCell.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//


import UIKit

class FlipHistoryCell: UITableViewCell {
    
    static let cellID = "MMFHistoryCell"
    static let cellHeight:CGFloat = 130
    
    @IBOutlet weak var lblLable1: UILabel!
    @IBOutlet weak var lblLable2: UILabel!
    @IBOutlet weak var viewBGView: UIView!
    @IBOutlet weak var imgBG: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewBGView.layer.cornerRadius = 12
        imgBG.layer.cornerRadius = 12
    }
}

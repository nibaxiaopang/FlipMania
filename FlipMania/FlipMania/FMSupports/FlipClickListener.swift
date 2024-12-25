//
//  ClickListener.swift
//  FlipMania
//
//  Created by jin fu on 2024/12/25.
//

import UIKit

// MARK: ClickListener for UIView
class FlipClickListener: UITapGestureRecognizer {
    var onClick : (() -> Void)? = nil
}

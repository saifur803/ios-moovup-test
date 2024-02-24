//
//  ListScreenView.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit


class ListScreenView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func setup() {
        backgroundColor = .white
    }
}

//
//  SplashScreenView.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 23/2/2024.
//

import Foundation
import UIKit


class SplashScreenView: UIView {
    
    let splashLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Moovup"
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let progressView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.color = .gray
        view.startAnimating()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        let safeArea = safeAreaLayoutGuide
        
        backgroundColor = .white
        
        addSubview(progressView)
        addSubview(splashLabel)
        
        progressView.centerXAnchor
            .constraint(equalTo: centerXAnchor)
            .isActive = true
        progressView.centerYAnchor
            .constraint(equalTo: centerYAnchor)
            .isActive = true
        
        splashLabel.centerXAnchor
            .constraint(equalTo: safeArea.centerXAnchor)
            .isActive = true
        splashLabel.topAnchor
            .constraint(equalTo: progressView.bottomAnchor, constant: 12)
            .isActive = true
    }
}

//
//  MapScreenView.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit
import GoogleMaps

class DetailsView: UIView {
    
    let peopleImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleToFill
        return view
    }()
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.alignment = .leading
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 18)
        return label
    }()

    let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = .systemFont(ofSize: 16)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func setup() {
        backgroundColor = .white
        
        addSubview(peopleImage)
        addSubview(stackView)
        
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(emailLabel)
        
        let margin: CGFloat = 10
        
        peopleImage.topAnchor
            .constraint(equalTo: topAnchor, constant: margin)
            .isActive = true
        peopleImage.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -margin)
            .isActive = true
        peopleImage.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: margin)
            .isActive = true
        peopleImage.heightAnchor
            .constraint(equalToConstant: 70)
            .isActive = true
        peopleImage.widthAnchor
            .constraint(equalToConstant: 70)
            .isActive = true
        
        stackView.topAnchor
            .constraint(equalTo: topAnchor, constant: margin)
            .isActive = true
        stackView.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -margin)
            .isActive = true
        stackView.leadingAnchor
            .constraint(equalTo: peopleImage.trailingAnchor, constant: margin)
            .isActive = true
        
    }

}

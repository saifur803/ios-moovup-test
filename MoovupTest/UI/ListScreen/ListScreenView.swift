//
//  ListScreenView.swift
//  MoovupTest
//
//  Created by Saifur Rahman on 24/2/2024.
//

import Foundation
import UIKit


class ListScreenView: UIView {
    
    let tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
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
        
        addSubview(tableView)
        
        tableView.topAnchor
            .constraint(equalTo: safeArea.topAnchor)
            .isActive = true
        tableView.bottomAnchor
            .constraint(equalTo: safeArea.bottomAnchor)
            .isActive = true
        tableView.leadingAnchor
            .constraint(equalTo: safeArea.leadingAnchor)
            .isActive = true
        tableView.trailingAnchor
            .constraint(equalTo: safeArea.trailingAnchor)
            .isActive = true
    }
}

class PeopleTableViewCell: UITableViewCell {
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .boldSystemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()
    
    static let identifier = "PeopleTableViewCell"
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        
        addSubview(nameLabel)
        
        let margin: CGFloat = 12
        
        nameLabel.topAnchor
            .constraint(equalTo: topAnchor, constant: margin)
            .isActive = true
        nameLabel.bottomAnchor
            .constraint(equalTo: bottomAnchor, constant: -margin)
            .isActive = true
        nameLabel.leadingAnchor
            .constraint(equalTo: leadingAnchor, constant: margin)
            .isActive = true
        nameLabel.trailingAnchor
            .constraint(equalTo: trailingAnchor, constant: -margin)
            .isActive = true
    }
}

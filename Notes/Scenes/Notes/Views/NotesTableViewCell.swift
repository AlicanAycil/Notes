//
//  NotesTableViewCell.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit

final class NotesTableViewCell: LayoutableTableViewCell {
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupViews() {
        backgroundColor = .appGray
        selectionStyle = .none
        addSubview(titleLabel)
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([

//          titleLabel
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
        ])
    }
}

extension NotesTableViewCell {
    
    func configure(title: String) {
        titleLabel.text = title
    }
}

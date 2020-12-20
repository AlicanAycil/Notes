//
//  Layoutable.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit

protocol Layoutable {
    
    func setupViews()
    func setupLayout()
}

extension Layoutable where Self: UIView {

    static func create() -> Self {
        
        let view = Self()
        view.setupViews()
        view.setupLayout()
        return view
    }
}

typealias LayoutableView = UIView & Layoutable
typealias LayoutableTableViewCell = UITableViewCell & Layoutable

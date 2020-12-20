//
//  NotesView.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit

final class NotesView: LayoutableView {
    
    private lazy var headerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var headerTitle: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Notes"
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var headerAddButton: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "add"), for: .normal)
        button.adjustsImageWhenHighlighted = false
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var headerLineView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.appLightGray.withAlphaComponent(0.5)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.backgroundColor = UIColor.appGray
        view.translatesAutoresizingMaskIntoConstraints = false
        view.estimatedRowHeight = 100
        view.rowHeight = UITableView.automaticDimension
        view.register(NotesTableViewCell.self, forCellReuseIdentifier: "NotesTableViewCell")
        return view
    }()
    
    func setupViews() {
        backgroundColor = UIColor.appGray
        addSubview(headerView)
        headerView.addSubview(headerTitle)
        headerView.addSubview(headerAddButton)
        headerView.addSubview(headerLineView)
        addSubview(tableView)
    }
    
    func setupLayout() {
        
        NSLayoutConstraint.activate([
            
            //headerView
            headerView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerView.heightAnchor.constraint(equalToConstant: 80),
            
            //headerTitle
            headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor),
            headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30),
            
            //headerAddButton
            headerAddButton.centerYAnchor.constraint(equalTo: headerView.centerYAnchor),
            headerAddButton.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10),
            headerAddButton.heightAnchor.constraint(equalToConstant: 32),
            headerAddButton.widthAnchor.constraint(equalToConstant: 32),
            
            //headerLineView
            headerLineView.heightAnchor.constraint(equalToConstant: 1),
            headerLineView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
            headerLineView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 30),
            headerLineView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
            
            //tableView
            tableView.topAnchor.constraint(equalTo: self.headerView.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            
        ])
        
    }
}


//
//  TableView.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit

extension UITableView {
    
    func dequeueReusableLayoutableCell(withIdentifier: String) -> UITableViewCell? {
        
        let cell = self.dequeueReusableCell(withIdentifier: withIdentifier)
        guard let layoutableCell = cell as? LayoutableTableViewCell  else {
            return cell
        }
        layoutableCell.setupViews()
        layoutableCell.setupLayout()
        return layoutableCell
    }
    
    func setEmptyStateMessage() {
        
        let messageLabel = UILabel(frame: CGRect(x: 20,
                                                 y: 20,
                                                 width: self.bounds.size.width-40,
                                                 height: self.bounds.size.height-40))
        messageLabel.text = "You haven't added note yet"
        messageLabel.textColor = UIColor.lightGray.withAlphaComponent(0.5)
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.systemFont(ofSize: 20)
        messageLabel.sizeToFit()
        
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }
    
    func removeEmptyStateMessage() {
        
        self.backgroundView = nil
        self.separatorStyle = .singleLine
        self.separatorColor = UIColor.appLightGray
        self.separatorInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
    }
}

//
//  NotesViewController+TableView.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//

import UIKit

extension NotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.routeToNoteDetailViewController(id: viewModel.notes[indexPath.row].id)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: nil) { (_, _, completionHandler) in
            self.interactor?.deleteNote(id: self.viewModel.notes[indexPath.row].id)
            completionHandler(true)
        }
        deleteAction.image = #imageLiteral(resourceName: "trash")
        deleteAction.backgroundColor = UIColor.appPink
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        configuration.performsFirstActionWithFullSwipe = false
        return configuration
    }
}

extension NotesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.notes.isEmpty ? tableView.setEmptyStateMessage() : tableView.removeEmptyStateMessage()
        return viewModel.notes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = layoutableView.tableView.dequeueReusableLayoutableCell(withIdentifier: "NotesTableViewCell") as? NotesTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configure(title: viewModel.notes[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}

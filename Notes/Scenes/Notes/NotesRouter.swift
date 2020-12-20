//
//  NotesRouter.swift
//  Notes
//
//  Created by Alican Aycil on 18.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.

import UIKit

@objc protocol NotesRoutingLogic {
    func routeToNoteDetailViewController(id: String?)
}

protocol NotesDataPassing {
    var dataStore: NotesDataStore? { get }
}

class NotesRouter: NSObject, NotesRoutingLogic, NotesDataPassing {
    weak var viewController: NotesViewController?
    var dataStore: NotesDataStore?
    
    func routeToNoteDetailViewController(id: String?) {
        let controller = NoteDetailViewController.builder()
        var dataStore = controller.router?.dataStore
        passDataToNoteDetail(destination: &dataStore, id: id)
        viewController?.navigationController?.pushViewController(controller, animated: true)
    }
    
    func passDataToNoteDetail(destination: inout NoteDetailDataStore?, id: String?) {
        destination?.id = id
    }
}

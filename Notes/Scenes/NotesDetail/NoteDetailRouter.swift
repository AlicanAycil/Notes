//
//  NoteDetailRouter.swift
//  Notes
//
//  Created by Alican Aycil on 19.12.2020.
//  Copyright (c) 2020 ___ORGANIZATIONNAME___. All rights reserved.
//


import UIKit

@objc protocol NoteDetailRoutingLogic {
    func routeToNotesViewController()
}

protocol NoteDetailDataPassing {
  var dataStore: NoteDetailDataStore? { get }
}

final class NoteDetailRouter: NSObject, NoteDetailRoutingLogic, NoteDetailDataPassing {
    
  weak var viewController: NoteDetailViewController?
  var dataStore: NoteDetailDataStore?
  
    func routeToNotesViewController() {
        viewController?.navigationController?.popViewController(animated: true)
    }
}

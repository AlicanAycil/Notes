//
//  RealmError.swift
//  Notes
//
//  Created by Alican Aycil on 20.12.2020.
//

import Foundation

extension RealmManager {
    enum RealmError: Error {
        case objectNotFound
        case genericError(_ error: String)
    }
}

//
//  Result+Extension.swift
//  Notes
//
//  Created by Alican Aycil on 20.12.2020.
//

import Foundation

extension Result where Success == Void {
    static var success: Result {
        return .success(())
    }
}

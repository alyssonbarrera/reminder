//
//  String+ext.swift
//  Reminder
//
//  Created by Alysson Barrera on 15/12/24.
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}

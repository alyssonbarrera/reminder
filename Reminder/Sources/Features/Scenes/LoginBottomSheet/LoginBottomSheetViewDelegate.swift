//
//  LoginBottomSheetViewDelegate.swift
//  Reminder
//
//  Created by Alysson Barrera on 15/12/24.
//

import UIKit

protocol LoginBottomSheetViewDelegate: AnyObject {
    func sendLoginData(user: String, password: String)
}

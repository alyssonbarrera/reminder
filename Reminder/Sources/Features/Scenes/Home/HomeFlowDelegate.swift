//
//  HomeFlowDelegate.swift
//  Reminder
//
//  Created by Alysson Barrera on 23/12/24.
//

import Foundation

public protocol HomeFlowDelegate: AnyObject {
    func navigateToRecipes()
    func logout()
}

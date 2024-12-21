//
//  ReminderFlowControlller.swift
//  Reminder
//
//  Created by Alysson Barrera on 21/12/24.
//

import UIKit

class ReminderFlowControlller {
    //MARK: - Properties
    private var navigationController: UINavigationController?
    
    //MARK: - Splash
    //MARK: - Login
    //MARK: - init
    public init() {}
    
    //MARK: - startFlow
    func start() -> UINavigationController? {
        let startViewController = SplashViewController()
        self.navigationController = UINavigationController(rootViewController: startViewController)
        return self.navigationController
    }
}
